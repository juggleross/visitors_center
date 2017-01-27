angular
.module('VisitorCenter')
.factory('Product', function($resource){
  return $resource('products/:id', {id: '@id'},{
  	index:   { method: 'GET', isArray: true, responseType: 'json' },
    update:  { method: 'PUT', responseType: 'json' }
  })
});


angular
.module('VisitorCenter')
.controller('productsController', function($scope, Product, Ability, Auth){
  $scope.products = Product.index();

  $scope.addProduct = function(){
  	product = Product.save($scope.newProduct);
  	$scope.products.push(product);
  	$scope.newProduct = {}
  };
  
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

  $scope.deleteProduct = function(index){
  	product = $scope.products[index];
  	Product.delete(product);
  	$scope.products.splice(index,1)
  }
});

angular
.module('VisitorCenter')
.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('products', {
      url: '/products',
      templateUrl: 'views/products.html',
      controller: 'productsController'
    })
});