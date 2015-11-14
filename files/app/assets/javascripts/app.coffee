//= require_self
//= require ./core/core
//= require ./pages/pages
//= require ./shared/shared

underscore = angular.module('underscore', [])
underscore.factory '_', [
  '$window'
  ($window) ->
    $window._
]

angular.module 'app', [
  "Devise"
  "ngCookies"
  "ngResource"
  "ngRoute"
  "ngSanitize"
  "templates"
  "ngFileUpload"
  "underscore"
  "app.core"
  "app.shared"
  "app.pages"
]

angular
  .module 'app'
  .config [
    "$locationProvider"
    ($locationProvider)->
      $locationProvider.html5Mode({enabled: true, requireBase: false}).hashPrefix('!')
  ]