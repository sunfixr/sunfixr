(function() {
  this.sunfixr.controller('InstallationIndexCtrl', [
    '$scope', '$location', '$http', function($scope, $location, $http) {
    $scope.installations = [];
return $http.get('./installations.json').success(function(data) {
return $scope.installations = data;
});
}
]);

}).call(this);
