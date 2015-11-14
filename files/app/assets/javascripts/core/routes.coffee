angular.module('app.core')
  .config(['$routeProvider', ($routeProvider)->
    $routeProvider
      .when '/',
        templateUrl: 'pages/index.html'
        controller: 'indexPageCtrl'
      .otherwise
        redirectTo: '/'
        
  ])