'use strict'

###*
 # @ngdoc service
 # @name rapbotBattlesApp.speechChunker
 # @description
 # # speechChunker
 # Thanks to http://stackoverflow.com/a/23808155/38743
###
angular.module('rapbotBattlesApp')
  .service 'SpeechChunker', ['$timeout', ($timeout) ->
    class SpeechChunker
      chunk: (utterance, settings, callback) ->
        settings = settings || {}
        chunk_size = settings.chunk_size || 160
        if settings && typeof settings.offset != 'undefined'
          txt = utterance.text.substring(settings.offset)
        else
          txt = utterance.text
        lines = (line.trim() for line in txt.split(/[\n.?!,]/))
        lines = (line + ',' for line in lines when line != '')
        chunks = []
        chunk = ''
        for line in lines
          continue if line.length <= 2
          if chunk.length + line.length < chunk_size
            chunk += ' ' + line
          else if line.length < chunk_size
            chunks.push chunk
            chunk = line
          else
            bits = line.split(/\s/)
            console.log bits
            index = 0
            while index < bits.length
              if chunk.length + bits[index].length < chunk_size
                chunk += ' ' + bits[index]
              else
                chunks.push chunk
                chunk = bits[index]
              index += 1
        chunks.push chunk
        if typeof chunks[0] != 'undefined' && chunks[0].length > 2
          chunk = chunks[0]
          new_utterance = new SpeechSynthesisUtterance(chunk)
          for x in utterance
            if utterance.hasownproperty(x) && x != 'text'
              new_utterance[x] = utterance[x]
          new_utterance.onend = =>
            settings.offset = settings.offset || 0
            settings.offset += chunk.length - 1
            @chunk utterance, settings, callback
          console.log(new_utterance) # important
          setTimeout (-> speechSynthesis.speak(new_utterance)), 0
        else
          callback() if callback

    new SpeechChunker()
  ]
