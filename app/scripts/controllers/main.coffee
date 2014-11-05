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
      $scope.rapbots.push(new Rapbot())

    $scope.add_rapbot()

    $scope.rap = (index) ->
      $scope.rapbots[index].rap SpeechChunker, ->
        console.log 'finished rapbot', index
        if index + 1 < $scope.rapbots.length
          rapbots_rap index + 1
        else
          console.log 'finished all rapbots'

    $scope.rapbots_ready = ->
      for rapbot in $scope.rapbots
        return false if !rapbot.has_lyrics() || !rapbot.voice
      true

    window.speechSynthesis.onvoiceschanged = ->
      return if $scope.voices.length > 0
      $scope.$apply ->
        for voice in window.speechSynthesis.getVoices()
          $scope.voices.push voice
        for rapbot in $scope.rapbots
          unless rapbot.voice
            rapbot.voice = $scope.voices[2]
  ]
