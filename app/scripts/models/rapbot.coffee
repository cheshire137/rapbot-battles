class Rapbot
  constructor: (data) ->
    data ||= {}
    @lyrics = data.lyrics || ''
    @voice = data.voice
    @pitch = data.pitch || 1
    @rate = data.rate || 5
    @volume = data.volume || 1

  has_lyrics: ->
    return false unless @lyrics
    @lyrics.replace(/\s/g, '') != ''

  rap: (SpeechChunker, callback) ->
    utterance = new SpeechSynthesisUtterance(@lyrics)
    utterance.voice = @voice if @voice
    utterance.pitch = @pitch
    utterance.rate = @rate
    utterance.volume = @volume
    SpeechChunker.chunk utterance, {chunk_size: 120}, ->
      callback() if callback

(exports ? this).Rapbot = Rapbot
