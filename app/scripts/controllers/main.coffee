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
        voice_index = $scope.rapbots[$scope.rapbots.length - 1].voice_index
      new_rapbot = new Rapbot
        voice_index: voice_index
      $scope.rapbots.push new_rapbot

    $scope.add_rapbot()

    $scope.rap = (index) ->
      $scope.rapbots[index].rap SpeechChunker, ->
        console.log 'finished rapbot', index
        if index + 1 < $scope.rapbots.length
          $scope.rap index + 1
        else
          console.log 'finished all rapbots'

    $scope.rapbots_ready = ->
      for rapbot in $scope.rapbots
        return false if !rapbot.has_lyrics() || !rapbot.voice_index
      true

    window.speechSynthesis.onvoiceschanged = ->
      return if $scope.voices.length > 0
      $scope.$apply ->
        for voice, index in window.speechSynthesis.getVoices()
          $scope.voices.push
            index: index
            name: voice.name
        for rapbot in $scope.rapbots
          unless rapbot.voice_index
            rapbot.voice_index = 2 # Google UK Female
  ]
