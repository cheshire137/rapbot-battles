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
    $scope.rapbots = []
    $scope.voices = []

    $scope.add_rapbot = ->
      if $scope.rapbots.length > 0
        last_rapbot = $scope.rapbots[$scope.rapbots.length - 1]
        voice_index = last_rapbot.voice_index
        rate = last_rapbot.rate
        pitch = last_rapbot.pitch
        volume = last_rapbot.volume
      new_rapbot = new Rapbot
        voice_index: voice_index
        rate: rate
        pitch: pitch
        volume: volume
      $scope.rapbots.push new_rapbot

    $scope.add_rapbot()

    $scope.remove_rapbot = (index) ->
      $scope.rapbots.splice(index, 1)

    $scope.rap = (index) ->
      $scope.rapbots[index].rap SpeechChunker, ->
        console.log 'finished rapbot', index
        if index + 1 < $scope.rapbots.length
          $scope.rap index + 1
        else
          console.log 'finished all rapbots'

    $scope.rapbots_ready = ->
      for rapbot in $scope.rapbots
        return false unless rapbot.has_lyrics()
      true

    window.speechSynthesis.onvoiceschanged = ->
      return if $scope.voices.length > 0
      $scope.$apply ->
        for voice, index in window.speechSynthesis.getVoices()
          $scope.voices.push
            index: index
            name: voice.name
  ]
