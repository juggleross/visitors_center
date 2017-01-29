angular
.module('VisitorCenter')
.controller('navigationController', function($scope, Auth, Ability){
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
  
  Auth.currentUser().then(function (user){
    $scope.user = user;
  });
  

  $scope.abilities = Ability.index();

  $scope.can = function(can_action){

    var arrLength = $scope.abilities.length;
    for(var i = 0; i < arrLength; i ++) { 
      if($scope.abilities[i].actions.indexOf(can_action) >= 0) {
        return $scope.abilities[i].can;
      }
    }
  };
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
