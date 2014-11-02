'use strict'

###*
 # @ngdoc function
 # @name rapbotBattlesApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the rapbotBattlesApp
###
angular.module('rapbotBattlesApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
