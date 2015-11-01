//= require_self
//= require ./core/core
//= require ./shared/shared

angular.module "app", [
  "Devise"
  "ngCookies"
  "ngResource"
  "ngRoute"
  "ngSanitize"
  "pascalprecht.translate"
  "templates"
  "ngFileUpload"
  "underscore"
  "app.core"
  "app.shared"
]