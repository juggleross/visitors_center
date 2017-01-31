angular
.module('VisitorCenter')
.factory("Moderation", function($resource) {
  return $resource("moderations/:id.json", { id: '@id' }, {
    show: { method: 'GET' },
    index:   { method: 'GET', isArray: true, responseType: 'json' },
    update:  { method: 'PUT', responseType: 'json' }
  });
})


angular
.module('VisitorCenter')
.controller("moderationsController", function($scope, Moderation, Ability, Category, $stateParams, $location) {
  $scope.moderations = Moderation.index();
  $scope.categories = Category.index();

  // $scope.showCategory = function(id) {
  //   var arrLength = $scope.categories.length;
  //   for(var i = 0; i < arrLength; i ++) { 
  //     if($scope.categories[i].id === id) {
  //       return $scope.categories[i].category_name;
  //     }
  //   }
  // }
  $scope.newModeration = Moderation.get({id: $stateParams.id})
  $scope.updateModeration = function(){ 
      Moderation.update({id: $scope.newModeration.id},{moderation: $scope.newModeration},function(){
        $location.path('/moderations');
      })
  };

  
  $scope.addModeration = function() {
    moderation = Moderation.save($scope.newModeration)
    $scope.newModeration = {}
  }

  $scope.acceptModeration = function(index) {
    moderation = $scope.moderations[index];
    accepted_params = {first_name: moderation.first_name,last_name: moderation.last_name, reason: moderation.reason, category_id: moderation.category_id, user_id: moderation.user_id};
    Moderation.save(accepted_params);

    Moderation.delete(moderation)
    $scope.moderations.splice(index, 1);
  }

  $scope.deleteModeration = function(index) {

    moderation = $scope.moderations[index]
    Moderation.delete(moderation)
    $scope.moderations.splice(index, 1);
  }

  $scope.abilities = Ability.index();

  $scope.can = function(can_action){

    var arrLength = $scope.abilities.length;
    for(var i = 0; i < arrLength; i ++) { 
      if($scope.abilities[i].actions.indexOf(can_action) >= 0) {
        return $scope.abilities[i].can;
      }
    }
  };

})

angular
.module('VisitorCenter')
.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('moderations', {
      url: '/moderations',
      templateUrl: 'views/_moderations.html',
      controller: 'moderationsController'
    })
    .state('moderations_edit', {
      url: '/moderations/:id/edit',
      templateUrl: 'views/moderations_edit.html',
      controller: 'moderationsController'
    })
});