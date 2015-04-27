(function() {
    this.sunfixr = angular.module('sunfixr', ['ngRoute']);
    this.sunfixr.config([
        '$routeProvider', function($routeProvider) {
        return $routeProvider.when('/installations', {
        templateUrl: '/templates/installations/index.html',
        controller: 'InstallationIndexCtrl'
        }).otherwise({
            templateUrl: '/templates/home.html',
            controller: 'HomeCtrl'
            });
        }
    ]);
}).call(this);


