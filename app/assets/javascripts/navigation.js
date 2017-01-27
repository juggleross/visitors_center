angular
.module('VisitorCenter')
.controller('navigationController', function($scope, Auth){
  $scope.signedIn = Auth.isAuthenticated;
  $scope.logout = Auth.logout;
  Auth.currentUser().then(function (user){
    $scope.user = user;
  });
   $scope.$on('devise:new-registration', function (e, user){
    $scope.user = user;
  });

  $scope.$on('devise:login', function (e, user){
    $scope.user = user;
  });

  $scope.$on('devise:logout', function (e, user){
    $scope.user = {};
  });
});

// angular
// .module('VisitorCenter')
// .config(function($stateProvider, $urlRouterProvider) {
//   $stateProvider
//     .state('navigate', {
//       url: '/navigate',
//       templateUrl: 'views/navigate.html',
//       controller: 'navigationController'
//     })
// });
