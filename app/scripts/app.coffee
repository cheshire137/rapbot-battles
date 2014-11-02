'use strict'

###*
 # @ngdoc overview
 # @name rapbotBattlesApp
 # @description
 # # rapbotBattlesApp
 #
 # Main module of the application.
###
angular
  .module('rapbotBattlesApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .otherwise
        redirectTo: '/'

