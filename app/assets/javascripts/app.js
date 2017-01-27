(function(){
  angular
    .module('VisitorCenter', ['ui.router','ngResource','ngRoute','templates', 'Devise'])
}())


angular
.module('VisitorCenter')
.factory("Ability", function($resource) {
  return $resource("abilities", {}, {
    index:   { method: 'GET', isArray: true, responseType: 'json' }
  });
})

angular
.module('VisitorCenter')
.factory("Category", function($resource) {
  return $resource("categories", {}, {
    index:   { method: 'GET', isArray: true, responseType: 'json' }
  });
})