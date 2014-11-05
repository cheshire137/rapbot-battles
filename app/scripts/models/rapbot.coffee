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
    console.log 'rap with voice', @voice
    utterance = new SpeechSynthesisUtterance(@lyrics)
    if @voice
      utterance.voice = @voice
    utterance.pitch = @pitch
    utterance.rate = @rate
    utterance.volume = @volume
    SpeechChunker.chunk utterance, {chunk_size: 120}, ->
      callback() if callback

(exports ? this).Rapbot = Rapbot
