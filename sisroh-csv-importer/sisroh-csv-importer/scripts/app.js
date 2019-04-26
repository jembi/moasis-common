'use strict';

var app = angular.module("mySISROHCsvImport", ["ngMaterial", "ngMessages", "ngAnimate", "ngResource", "ngSanitize", "md.data.table", "ngFileUpload", "angular-loading-bar"]);

// function to boostrap the app manually - used to first get config data before angular initializes
(function() {

  function fetchData() {
    var initInjector = angular.injector(['ng']);
    var $http = initInjector.get('$http');

    return $http.get('config/config.json').then(function(response) {
      app.constant('CONFIG', response.data);
    }, function() {
      // Handle error case
      app.constant('CONFIG', 'No Constants Loaded');
    });
  }

  function bootstrapApplication() {
    angular.element(document).ready(function() {
      angular.bootstrap(document, ['mySISROHCsvImport']);
    });
  }

  // request config data and bootstrap on success
  fetchData().then(bootstrapApplication);

}());



app.config(['cfpLoadingBarProvider', function(cfpLoadingBarProvider) {
  cfpLoadingBarProvider.includeSpinner = false;
}])

app.config(['$httpProvider', function($httpProvider) {
  //initialize get if not there
  if (!$httpProvider.defaults.headers.get) {
      $httpProvider.defaults.headers.get = {};    
  }    

  //disable IE ajax request caching
  $httpProvider.defaults.headers.get['If-Modified-Since'] = 'Mon, 26 Jul 1997 05:00:00 GMT';
  // extra
  $httpProvider.defaults.headers.get['Cache-Control'] = 'no-cache';
  $httpProvider.defaults.headers.get['Pragma'] = 'no-cache';

}])