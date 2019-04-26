
app.controller("landingCtrl", function($scope, $rootScope, $timeout, $document, $interval, CONFIG, $mdDialog, $mdMedia, Upload, Settings, Api) {


  $scope.uploadResultBox = {};
  $scope.uploadResultBox.show = false;
  $scope.uploadResultBox.status = null;
  $scope.uploadResultBox.message = null;
  $scope.pageSizeOption = [5, 10, 20, 50, 100];
  $scope.showEventsLoader = false;
  $scope.data = {
    files: null,
    levels: [],
    orgUnit: null,
    imports: [],
    importsPager: null,
    selectedOrgUnit: null
  };
  

  $scope.query = {
    /*order: 'name',*/
    orgUnit: null,
    pageSize: 100,
    page: 1
  };
  
  var userDetailsSuccess = function(result){
    $scope.user = {};
    $scope.user.name = result.displayName;
    $scope.user.id = result.id;
  };
  $scope.promiseUserDetails = Api.CurrentUser.get({}, userDetailsSuccess).$promise;

  /* ------------------------------------------------------------------- */


  // file upload functions
  $scope.$watch('data.files', function () {
    $scope.upload($scope.data.files);
  });
  $scope.$watch('file', function () {
    if ($scope.file != null) {
      $scope.data.files = [$scope.file]; 
    }
  });

  $scope.upload = function (files) {
    
    if (files && files.length) {
      $scope.uploadPercentage = 0;
      for (var i = 0; i < files.length; i++) {
        var file = files[i];
        if (!file.$error) {
          Upload.upload({
            url: CONFIG.importServiceUrl + '/uploads',
            data: {
              username: $scope.user.name,
              userId: $scope.user.id,
              orgUnitUID: $scope.data.selectedOrgUnit,
              file: file
            }
          }).then(function (resp) {

            var message = '';
            if (resp.status === 202){
              message = 'Your CSV file has been uploaded Successfully!';
            }else{
              message = 'An error occured while trying to upload your CSV. Please try again.';
            }

            $scope.showUploadResult(resp.status, message);
          }, function (err) {
            console.log(err)
            $scope.showUploadResult(err.status, 'An error occured while trying to upload your CSV.<br />Please try again.');
          }, function (evt) {
            var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
            $scope.uploadPercentage = progressPercentage;
          });
        }
      }
    }
  };


  $scope.showUploadResult = function(status, message){
    $scope.data.files = [];
    $scope.uploadResultBox.show = true;
    $scope.uploadResultBox.status = status;
    $scope.uploadResultBox.message = message;

    // reload on upload success
    if ( status === 202 ){
      getImportFilesSqlView();
    }

    $timeout(function() {
      $scope.uploadResultBox.show = false;
      $scope.uploadResultBox.status = null;
      $scope.uploadResultBox.message = null;
    }, 5000);
  }


  /* ------------------------------------------------------------------- */

  // we create watcher to listen when an OrgUnit value has been selected
  $scope.$watch(function(){ return $scope.data.selectedOrgUnit; }, function(newVal, oldVal){
    if ( newVal ){
      $scope.showEventsLoader = true;

      getOrgUnit( $scope.data.selectedOrgUnit );
      getImportFilesSqlView( );
      clearOrgUnitLevels();
      updateOrgUnitLevels( $scope.data.selectedOrgUnit );

      $rootScope.$broadcast('orgUnitSelected');
    }
  }, true)

  var getOrgUnit = function( uid ){
    var orgUnit = Api.OrgUnit.get({ uid: $scope.data.selectedOrgUnit }, function( result ){
      $scope.data.orgUnit = result;
    }, function( err ){
      console.log( err )
    });
  }


  /* ------------------------------------------------------------------- */


  $scope.$watch(function () { return Settings.ctrl.importFilesRREnabled; }, function(data) {
    if (Settings.ctrl.importFilesRREnabled){
      $scope.importFilesRRInterval = $interval(function (index) {
        getImportFilesSqlView();
      }, Settings.ctrl.importFilesRR);
    }else{
      $interval.cancel( $scope.importFilesRRInterval );
    }
  }, true);

  $scope.$on('$destroy', function() {
    $interval.cancel( $scope.importFilesRRInterval );
  });




  var getImportFilesSqlView = function( ){
    // uid - xiHwkBNV54K - Import Files 
    $scope.promiseImportFilesSqlView = Api.SqlView.get({ uid: CONFIG.dhisUIDs.sqlViewImportFiles, var: 'ouid:'+$scope.data.selectedOrgUnit }, getFilesSuccess).$promise;
  }






  // $scope.selected = [];

  function getFilesSuccess(result) {
    // update mapping Indexes
    for ( var i = 0; i < result.headers.length; i++ ){
      var name = result.headers[i].name;
      if (importFilesSqlViewMapping[name]){
        importFilesSqlViewMapping[name].index = i; 
      }
    }

    $scope.data.imports = [];

    if ( result.rows.length > 0 ){
      for ( var i = 0; i < result.rows.length; i++ ){
        $scope.data.imports.push( constructImportFilesObject(result.rows[i]) )
      }
    }

    $scope.data.importsPager = 1;
    $scope.showEventsLoader = false;
  }

  $scope.onPaginate = function (page, pageSize) {
    getImportFilesSqlView(angular.extend({ }, $scope.query, { page: page, pageSize: pageSize, orgUnit: $scope.data.selectedOrgUnit }));
  };

  $scope.onReorder = function (order) {
    getImportFilesSqlView(angular.extend({ }, $scope.query, { order: order, orgUnit: $scope.data.selectedOrgUnit }));
  };






  /* ------------------------------------------------------------ */

  // get all orgUnit levels
  var tempOrgUnitLevels = Api.OrgUnitLevels.get({}, function( result ){

    for (var i = 0; i < result.organisationUnitLevels.length; i++) { 

      $scope.data.levels.push({
        id: result.organisationUnitLevels[i].id,
        name: result.organisationUnitLevels[i].name,
        level: result.organisationUnitLevels[i].level
      });

    }

    $scope.data.levels.sort(function(a, b){
      return a.level - b.level;
    })

  }, function( err ){
    console.log( err )
  });

  var clearOrgUnitLevels = function(){
    for( var i = 0; i < $scope.data.levels.length; i++ ){
      $scope.data.levels[i].orgUnit = '';
    }
  }



  var updateOrgUnitLevels = function( uid ){

    var orgUnit = Api.OrgUnit.get({ uid: uid }, function( result ){
      for( var i = 0; i < $scope.data.levels.length; i++ ){
        if ( $scope.data.levels[i].level === result.level ){
          $scope.data.levels[i].orgUnit = result.name;
        }
      }

      // if orgUnit has parent property
      if ( result.parent ){
        updateOrgUnitLevels( result.parent.id );
      }

    }, function( err ){
      console.log( err )
    });

  }

  /* ------------------------------------------------------------ */


  $scope.showImportDetails = function(importObject) {
    $mdDialog.show({
      locals: { orgUnit: $scope.data.orgUnit, importObject: importObject },
      controller: 'importViewerCtrl',
      templateUrl: 'views/dialog.importViewer.html',
      parent: angular.element(document.body),
      clickOutsideToClose:false,
      fullscreen: true
    })
    .then(function() {
      // nothing yet
    }, function() {
      // cancelled
    });
  };














  var importFilesSqlViewMapping = {
    id: { index: null, name: 'Import File  ID' },
    name: { index: null, name: 'Filename' },
    username: { index: null, name: 'Username' },
    userid: { index: null, name: 'User ID' },
    error: { index: null, name: 'Error' },
    status: { index: null, name: 'Status' },
    created: { index: null, name: 'Created' },
    updated: { index: null, name: 'Updated' },
    pending: { index: null, name: 'Pending' },
    processing: { index: null, name: 'Processing' },
    failed: { index: null, name: 'Failed' },
    duplicate: { index: null, name: 'Duplicate' },
    successful: { index: null, name: 'Successful' }
  }

  var constructImportFilesObject = function(record){
    return {
      id: record[ importFilesSqlViewMapping.id.index ],
      date: record[ importFilesSqlViewMapping.created.index ],
      filename: record[ importFilesSqlViewMapping.name.index ],
      user: record[ importFilesSqlViewMapping.username.index ],
      status: record[ importFilesSqlViewMapping.status.index ],
      error: record[ importFilesSqlViewMapping.error.index ],
      results: {
        failed: record[ importFilesSqlViewMapping.failed.index ],
        successful: record[ importFilesSqlViewMapping.successful.index ],
        pending: record[ importFilesSqlViewMapping.pending.index ],
        processing: record[ importFilesSqlViewMapping.processing.index ],
        duplicate: record[ importFilesSqlViewMapping.duplicate.index ]
      }
    }
  }


});