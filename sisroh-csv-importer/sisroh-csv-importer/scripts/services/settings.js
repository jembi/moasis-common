'use strict';

app.factory('Settings', function(){

	var settings = {};
	settings.ctrl = {
    importFilesRR: 5000,
    importFilesRREnabled: false,
    importRowsRR: 5000,
    importRowsRREnabled: false,
    show: false
  };

	settings.toggleImportFilesRREnabled = function(){
		settings.ctrl.importFilesRREnabled = !settings.ctrl.importFilesRREnabled;
	}
	settings.setImportFilesRR = function(val){
		settings.ctrl.importFilesRR = val;
	}

	settings.toggleImportRowsRREnabled = function(){
		settings.ctrl.importRowsRREnabled = !settings.ctrl.importRowsRREnabled;
	}
	settings.setImportRowsRR = function(val){
		settings.ctrl.importRowsRR = val;
	}

	settings.setCtrlShow = function(){
		settings.ctrl.show = true;
	}

	return settings;

});