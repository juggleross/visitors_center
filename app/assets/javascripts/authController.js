angular
.module('VisitorCenter')
.controller('authController', function($scope, $state, Auth){
  $scope.login = function() {
    Auth.login($scope.user).then(function(){
      $state.go('visitors');
    });
  };

  $scope.register = function() {
    Auth.register($scope.user).then(function(){
      $state.go('visitors');
    });
  };
});

angular
.module('VisitorCenter')
.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
     .state('login', {
      url: '/login',
      templateUrl: 'views/_login.html',
      controller: 'authController',
      onEnter: ['$state', 'Auth', function($state, Auth) {
        Auth.currentUser().then(function (){
          $state.go('visitors');
        })
      }]
    })
    .state('register', {
      url: '/register',
      templateUrl: 'views/_register.html',
      controller: 'authController',
      onEnter: ['$state', 'Auth', function($state, Auth) {
        Auth.currentUser().then(function (){
          $state.go('visitors');
        })
      }]
    })
});