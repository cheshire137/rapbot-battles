class Rapbot
  constructor: (data) ->
    data ||= {}
    @lyrics = data.lyrics || ''

(exports ? this).Rapbot = Rapbot
