'use strict'

###*
 # @ngdoc function
 # @name rapbotBattlesApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the rapbotBattlesApp
###
angular.module('rapbotBattlesApp')
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
