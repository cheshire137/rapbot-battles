'use strict'

###*
 # @ngdoc function
 # @name rapbotBattlesApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the rapbotBattlesApp
###
angular.module('rapbotBattlesApp')
  .controller 'MainCtrl', ['$scope', '$timeout', 'SpeechChunker', ($scope, $timeout, SpeechChunker) ->
    # speak_lines = (lines, index) ->
    #   line = lines[index]
    #   console.log line
    #   voices = window.speechSynthesis.getVoices()
    #   msg = new SpeechSynthesisUtterance()
    #   msg.voice = voices[2]
    #   # msg.voiceURI = 'native'
    #   # msg.volume = 1
    #   # msg.rate = 1
    #   # msg.pitch = 2
    #   msg.text = line
    #   # msg.lang = 'en-us'
    #   msg.onend = (event) ->
    #     console.log 'Finished in', event.elapsedTime, 'seconds'
    #   speechSynthesis.speak(msg)

    $scope.rap = ->
      text = document.getElementById('rapper-1-lyrics').textContent
      # lines = (line.trim() for line in text.split("\n"))
      # lines = (line for line in lines when line != '')
      # paragraph = lines.join(".\n")
      # speak_lines lines, 0
      utterance = new SpeechSynthesisUtterance(text)
      voices = speechSynthesis.getVoices()
      utterance.voice = voices[2]
      SpeechChunker.chunk utterance, {chunk_size: 120}, ->
        console.log 'finished rapper 1'
  ]
