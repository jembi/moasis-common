
app.controller("SidebarControlsCtrl", function($scope, $rootScope, $interval, Settings) {

  $scope.ctrl = {
    importFilesRR: Settings.ctrl.importFilesRR,
    importFilesRREnabled: Settings.ctrl.importFilesRREnabled,
    importRowsRR: Settings.ctrl.importRowsRR,
    importRowsRREnabled: Settings.ctrl.importRowsRREnabled,
    show: Settings.ctrl.show,
  }

  $scope.$watch('ctrl.importFilesRREnabled', function(newVal, oldVal) {
    if (newVal !== oldVal){
      Settings.toggleImportFilesRREnabled();
    }
  }, true);

  $scope.$watch('ctrl.importFilesRR', function(newVal, oldVal) {
    if (newVal !== oldVal){
      Settings.setImportFilesRR(newVal);
      $scope.ctrl.importFilesRREnabled = false;
    }
  }, true);




  $scope.$watch('ctrl.importRowsRREnabled', function(newVal, oldVal) {
    if (newVal !== oldVal){
      Settings.toggleImportRowsRREnabled();
    }
  }, true);

  $scope.$watch('ctrl.importRowsRR', function(newVal, oldVal) {
    if (newVal !== oldVal){
      Settings.setImportRowsRR(newVal);
      $scope.ctrl.importRowsRREnabled = false;
    }
  }, true);



  $scope.$on('orgUnitSelected', function(event, args) {
    Settings.setCtrlShow();
    $scope.ctrl.show = true;
  });

});