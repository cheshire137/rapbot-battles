'use strict'

describe 'Service: speechChunker', ->

  # load the service's module
  beforeEach module 'rapbotBattlesApp'

  # instantiate service
  speechChunker = {}
  beforeEach inject (_speechChunker_) ->
    speechChunker = _speechChunker_

  it 'should do something', ->
    expect(!!speechChunker).toBe true
