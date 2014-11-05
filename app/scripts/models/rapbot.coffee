class Rapbot
  constructor: (data) ->
    data ||= {}
    @lyrics = data.lyrics || ''
    @voice_index = data.voice_index || 2 # Google UK Female
    @pitch = data.pitch || 1
    @rate = data.rate || 5
    @volume = data.volume || 1

  has_lyrics: ->
    return false unless @lyrics
    @lyrics.replace(/\s/g, '') != ''

  rap: (SpeechChunker, callback) ->
    utterance = new SpeechSynthesisUtterance()
    if @voice_index
      voices = window.speechSynthesis.getVoices()
      utterance.voice = voices[@voice_index]
    utterance.pitch = @pitch
    utterance.rate = @rate
    utterance.volume = @volume
    utterance.text = @lyrics
    SpeechChunker.chunk utterance, {chunk_size: 120}, ->
      callback() if callback

(exports ? this).Rapbot = Rapbot
