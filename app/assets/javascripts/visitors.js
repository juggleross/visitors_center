
angular
.module('VisitorCenter')
.factory("Visitor", function($resource) {
  return $resource("visitors/:id.json", { id: '@id' }, {
    show: { method: 'GET'},
    index:   { method: 'GET', isArray: true, responseType: 'json' },
    update:  { method: 'PUT', responseType: 'json' }
  });
})

angular
.module('VisitorCenter')
.controller("visitorsController", function($scope, Visitor, Ability, Category, Auth,$stateParams, $location) {
  $scope.visitors = Visitor.index();
  $scope.categories = Category.index();
  $scope.moderations = Visitor.index();
  // $scope.categories = [1,2,3,4]
  // $scope.showCategory = function(id) {
  //   var arrLength = $scope.categories.length;
  //   for(var i = 0; i < arrLength; i ++) { 
  //     if($scope.categories[i].id === id) {
  //       return $scope.categories[i].category_name;
  //     }
  //   }
  // }

  // rejection part
  $scope.shouldShowRejection = function(value) {
    return (value === "rejection");
  }


  // moderations part

  $scope.shouldShowModeration = function(value) {
    return (value === "moderation");
  }

  
  $scope.acceptModerationVisitor = function(local_moderation){ 
    local_moderation.state = "acception"
    Visitor.update({id: local_moderation.id},{visitor: local_moderation});
  };


  $scope.newModeration = Visitor.get({id: $stateParams.id})
  $scope.updateModeration = function(){ 
      Visitor.update({id: $scope.newModeration.id},{visitor: $scope.newModeration},function(){
        $location.path('/moderations');
      })
  };

  $scope.addModeration = function() {
    $scope.newModeration.state = "acception"
    moderation = Visitor.save($scope.newModeration)
    $scope.newModeration = {}
  }

  $scope.rejectModeration = function(local_moderation) {
    local_moderation.state = "rejection"
    Visitor.update({id: local_moderation.id},{visitor: local_moderation});
  }

  // visitor parts

  $scope.newVisitor = Visitor.get({id: $stateParams.id})
  $scope.updateVisitor = function(){ 
      Visitor.update({id: $scope.newVisitor.id},{visitor: $scope.newVisitor},function(){
        $location.path('/visitors');
      })
  };

  $scope.shouldShow = function(value){ 
      return (value === 'acception');
  };


  $scope.addVisitor = function() {
    visitor = Visitor.save($scope.newVisitor)
    // $scope.visitors.push(visitor)
    $scope.newVisitor = {}
  }

  $scope.deleteVisitor = function(index) {

    visitor = $scope.visitors[index]
    Visitor.delete(visitor)
    $scope.visitors.splice(index, 1);
  }

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

})

// angular
// .module('VisitorCenter')
// .controller("visitorsUpdateController", function($scope, $location,Visitor, Ability, Category, Auth,$stateParams) {
//   $scope.visitors = Visitor.index();
//   $scope.categories = Category.index();

//   $scope.newVisitor = Visitor.get({id: $stateParams.id})
//   $scope.updateVisitor = function(){ 
//       Visitor.update({id: $scope.newVisitor.id},{visitor: $scope.newVisitor},function(){
//         $location.path('/visitors');
//       })
//   };


// })

angular
.module('VisitorCenter')
.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('visitors', {
      url: '/visitors',
      templateUrl: 'views/_visitors.html',
      controller: 'visitorsController'
    })
    .state('visitors_edit', {
      url: '/visitors/:id/edit',
      templateUrl: 'views/visitors_edit.html',
      controller: 'visitorsController'
    })
    .state('moderations', {
      url: '/moderations',
      templateUrl: 'views/_moderations.html',
      controller: 'visitorsController'
    })
    .state('moderations_edit', {
      url: '/moderations/:id/edit',
      templateUrl: 'views/moderations_edit.html',
      controller: 'visitorsController'
    })
    .state('rejections', {
      url: '/rejections',
      templateUrl: 'views/_rejections.html',
      controller: 'visitorsController'
    })

    $urlRouterProvider.otherwise('/visitors')
});