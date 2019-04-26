
app.controller("importViewerCtrl", function($scope, $mdDialog, $mdToast, $timeout, $interval, CONFIG, orgUnit, importObject, Settings, Api) {

  importObject = angular.copy(importObject);
  $scope.person = null;
  $scope.personView = false;
  $scope.showEventsLoader = true;

  var getStatusColor = function(status){
    switch (status){
      case 'Successful':
        statusColor = CONFIG.statusColor.successful;
        break;
      case 'Failed':
        statusColor = CONFIG.statusColor.failed;
        break;
      case 'Pending':
        statusColor = CONFIG.statusColor.pending;
        break;
      case 'Duplicate':
        statusColor = CONFIG.statusColor.duplicate;
        break;
      case 'Processing':
        statusColor = CONFIG.statusColor.processing;
        break;
    }
    return statusColor;
  }
  $scope.importObject = importObject;
  $scope.importObject.statusColor = getStatusColor(importObject.status);


  var getImportRowsSqlView = function(){
    // uid - hU3JKqhW6OQ - Import Rows 
    $scope.promiseImportRowsSqlView = Api.SqlView.get({ uid: CONFIG.dhisUIDs.sqlViewImportRows, var: 'fileId:'+importObject.id }, getRowsSuccess).$promise;
  }
  getImportRowsSqlView();



  // check refresh rate settings
  if (Settings.ctrl.importRowsRREnabled){
    $scope.importRowsRRInterval = $interval(function (index) {
      getImportRowsSqlView();
    }, Settings.ctrl.importRowsRR);

    $scope.$on('$destroy', function() {
      $interval.cancel( $scope.importRowsRRInterval );
    });
  }


  function getRowsSuccess(result) {

    // update mapping Indexes
    for ( var i = 0; i < result.headers.length; i++ ){
      var name = result.headers[i].name;
      if (importRowsSqlViewMapping[name]){
        importRowsSqlViewMapping[name].index = i;
      }
    }

    $scope.importObject.results = [];

    if ( result.rows.length > 0 ){
      for ( var i = 0; i < result.rows.length; i++ ){
        $scope.importObject.results.push( constructImportRowsObject(result.rows[i]) )
      }
    }

    $scope.tabs = {
      Pending: { title: 'Pending', data: [], rowLimit: 10 },
      Processing: { title: 'Processing', data: [], rowLimit: 10 },
      Duplicate: { title: 'Duplicate', data: [], rowLimit: 10 },
      Failed: { title: 'Failed', data: [], rowLimit: 10 },
      Successful: { title: 'Successful', data: [], rowLimit: 10 }
    };

    var importRows = $scope.importObject.results;
    for ( var i = 0; i < importRows.length; i++ ){
      $scope.tabs[importRows[i].status].data.push( importRows[i] );
    }

    $scope.showEventsLoader = false;
    $scope.selectedIndex = 0;

  }


  // rerun object
  $scope.rerun = {
    allowSingle: false,
    loadingSingle: false,
    allowSelected: false,
    loadingSelected: false,
    allowAll: false,
    loadingAll: false,
    selected: [],
    rerunList: [],
    confirmRerun: function(action, row_id){
      $scope.rerun.rerunList = [];

      switch (action){
        case 'single':
          $scope.rerun.rerunList = [row_id];
          $scope.rerun.loadingSingle = true;
          break;
        case 'selected':
          $scope.rerun.rerunList = $scope.rerun.selected;
          $scope.rerun.loadingSelected = true;
          break;
        case 'all':
          for ( var i = 0; i < $scope.tabs.Failed.data.length; i++ ){
            $scope.rerun.rerunList.push($scope.tabs.Failed.data[i].row_id);
          }
          $scope.rerun.loadingAll = true;
          break;
      }

      $scope.rerunPromise = Api.Rerun.save( {}, { fileId: importObject.id, rowIds: $scope.rerun.rerunList }, function(){
        $mdToast.show(
          $mdToast.simple()
            .textContent('Rerun successfully submitted!')
            .position('top right')
            .hideDelay(3000)
            .theme("success-toast")
        );

        //  reset selected list
        $scope.rerun.rerunList = [];
        $scope.rerun.selected = [];

        getImportRowsSqlView();
        $scope.rerun.loadingSingle = false;
        $scope.rerun.loadingSelected = false;
        $scope.rerun.loadingAll = false;
      }, function(err){
        $mdToast.show(
          $mdToast.simple()
            .textContent('An error occurred trying to rerun: ' + err.data)
            .position('top right')
            .hideDelay(3000)
            .theme("error-toast")
        );

        $scope.rerun.loadingSingle = false;
        $scope.rerun.loadingSelected = false;
        $scope.rerun.loadingAll = false;
      }).$promise;
      
    }
  }


  // if failed rows exists - rerun should be allowed
  $scope.$watch('tabs.Failed.data.length', function (newVal, oldVal) {
    if (newVal > 0){
      $scope.rerun.allowSelected = true;
      $scope.rerun.allowAll = true;
    }
  });


  $scope.toggleSelectedRows = function (item, list) {
    var idx = list.indexOf(item);
    if (idx > -1) {
      list.splice(idx, 1);
    }
    else {
      list.push(item);
    }
  };
  

  $scope.showRowLists = function(){
    $scope.person = null;
    $scope.personView = false;

    if ($scope.tabs.Failed.data.length > 0){
      $scope.rerun.allowSelected = true;
      $scope.rerun.allowAll = true;
    }else{
      $scope.rerun.allowSelected = false;
      $scope.rerun.allowAll = false;
    }

    $scope.rerun.allowSingle = false;
  }


  $scope.showRowDetails = function(importRow) {
    $scope.person = angular.copy(importRow);
    $scope.personView = true;

    if (importRow.status === 'Failed'){
      $scope.rerun.allowSingle = true;
    }else{
      $scope.rerun.allowSingle = false;
    }
    
    $scope.rerun.allowSelected = false;
    $scope.rerun.allowAll = false;
  };


  /* dialogModal functions */

  $scope.reloadList = function() {
    $mdDialog.hide('reload');
  };

  $scope.hide = function() {
    $mdDialog.hide();
  };

  $scope.cancel = function() {
    $mdDialog.cancel();
  };


  $scope.increaseRowLimit = function(rowLimit, key) {
    $scope.tabs[key].rowLimit = rowLimit + 10;
  };








  var importRowsSqlViewMapping = {
    row_id: { index: null, name: 'Import Row ID' },
    file_id: { index: null, name: 'Filename' },
    status: { index: null, name: 'Username' },
    created: { index: null, name: 'User ID' },
    updated: { index: null, name: 'Error' },
    error: { index: null, name: 'Status' },

    obito: { index: null, name: 'Obito' },
    obito_id_obitos: { index: null, name: 'ID Obito' },
    obito_n_certificado_obito: { index: null, name: 'N Certificado Obit' },
    obito_n_arquivo: { index: null, name: 'N Arquivo' },
    obito_n_arquivo_importados: { index: null, name: 'N Arquivo Importados' },
    obito_hospital_id: { index: null, name: 'Hospital ID' },
    obito_data_obito: { index: null, name: 'Data Obito' },
    obito_local_ocorrencia_id: { index: null, name: 'Local Ocorrencia ID' },
    obito_causa_basica: { index: null, name: 'Causa Basica' },
    obito_causa_directa: { index: null, name: 'Causa Directa' },
    obito_causa_intermedia: { index: null, name: 'Causa Intermedi' },
    obito_tipo_obito_id: { index: null, name: 'Tipo Obito ID' },
    obito_tipo_obito_fetal_id: { index: null, name: 'Tipo Obito Fetal ID' },
    obito_morte_durante_o_parto_id: { index: null, name: 'Morte Durante O Parto ID' },
    obito_morte_apos_o_parto_id: { index: null, name: 'Morte Apos O Parto ID' },
    obito_autopsia_id: { index: null, name: 'Autopsia ID' },
    obito_created: { index: null, name: 'Created' },
    obito_modified: { index: null, name: 'Modified' },

    individuo: { index: null, name: 'Individuo' },
    individuo_id_individuos: { index: null, name: 'ID Individuos' },
    individuo_obito_id: { index: null, name: 'Obito ID' },
    individuo_nid: { index: null, name: 'NID' },
    individuo_data_nascimento: { index: null, name: 'Data Nascimento' },
    individuo_raca_id: { index: null, name: 'Raca ID' },
    individuo_sexo_id: { index: null, name: 'Sexo ID' },
    individuo_provincia_id: { index: null, name: 'Provincia ID' },
    individuo_nacionalidade: { index: null, name: 'Nacionalidade' },
    individuo_individuo_id: { index: null, name: 'Individuo ID' },
    individuo_created: { index: null, name: 'Created' },
    individuo_modified: { index: null, name: 'Modified' },

    internamento: { index: null, name: 'Internamento' },
    internamento_id_internamentos: { index: null, name: 'ID Internamentos' },
    internamento_hospital_id: { index: null, name: 'Hospital ID' },
    internamento_data_internamento: { index: null, name: 'Data Internamento' },
    internamento_hora_internamento: { index: null, name: 'Hora Internamento' },
    internamento_servico_id: { index: null, name: 'Servico ID' },
    internamento_tipo_admissao_id: { index: null, name: 'Tipo Admissao ID' },
    internamento_obito_id: { index: null, name: 'Obito ID' },
    internamento_created: { index: null, name: 'Created' },
    internamento_modified: { index: null, name: 'Modified' },

    fetal: { index: null, name: 'Fetal' },
    fetal_id_fetais: { index: null, name: 'ID Fetais' },
    fetal_idade_mae: { index: null, name: 'Idade Mae' },
    fetal_filhos_nascidos_vivos: { index: null, name: 'Filhos Nascidos Vivos' },
    fetal_filhos_nascidos_mortos: { index: null, name: 'Filhos Nascidos Mortos' },
    fetal_gestacao_periodo_id: { index: null, name: 'Gestacao Periodo ID' },
    fetal_tipo_parto_id: { index: null, name: 'Tipo Parto ID' },
    fetal_morte_parto_id: { index: null, name: 'Morte Parto ID' },
    fetal_obito_id: { index: null, name: 'Obito ID' },
    fetal_created: { index: null, name: 'Created' },
    fetal_modified: { index: null, name: 'Modified' },

    hospital: { index: null, name: 'Hospital' },
    hospital_id_hospitais: { index: null, name: 'ID Hospitais' },
    hospital_codigo_hospital: { index: null, name: 'Codigo Hospital' },
    hospital_nome_hospital: { index: null, name: 'Nome Hospital' },
    hospital_distrito_id: { index: null, name: 'Distrito ID' },
    hospital_nivel_hospital: { index: null, name: 'Nivel Hospital' },
    hospital_n_arquivo: { index: null, name: 'N Arquivo' },
    hospital_created: { index: null, name: 'Created' },
    hospital_modified: { index: null, name: 'Modified' },

    endereco: { index: null, name: 'Endereco' },
    endereco_id_enderecos: { index: null, name: 'ID Enderecos' },
    endereco_provincia_id: { index: null, name: 'Provincia ID' },
    endereco_distrito_id: { index: null, name: 'Distrito ID' },
    endereco_individuo_id: { index: null, name: 'Individuo ID' },
    endereco_localidade: { index: null, name: 'Localidade' },
    endereco_bairro: { index: null, name: 'Bairro' },
    endereco_created: { index: null, name: 'Created' },
    endereco_modified: { index: null, name: 'Modified' }
  }
  // make scope varibale for view referrence
  $scope.importRowsSqlViewMapping = importRowsSqlViewMapping;

  var constructImportRowsObject = function(record){

    return {
      checked: false,
      statusColor: getStatusColor( record[ importRowsSqlViewMapping.status.index ] ),
      row_id: record[ importRowsSqlViewMapping.row_id.index ],
      file_id: record[ importRowsSqlViewMapping.file_id.index ],
      status: record[ importRowsSqlViewMapping.status.index ],
      created: record[ importRowsSqlViewMapping.created.index ],
      updated: record[ importRowsSqlViewMapping.updated.index ],
      error: record[ importRowsSqlViewMapping.error.index ],
      details: {
        obito: {
          obito_id_obitos: record[ importRowsSqlViewMapping.obito_id_obitos.index ],
          obito_n_certificado_obito: record[ importRowsSqlViewMapping.obito_n_certificado_obito.index ],
          obito_n_arquivo: record[ importRowsSqlViewMapping.obito_n_arquivo.index ],
          obito_n_arquivo_importados: record[ importRowsSqlViewMapping.obito_n_arquivo_importados.index ],
          obito_hospital_id: record[ importRowsSqlViewMapping.obito_hospital_id.index ],
          obito_data_obito: record[ importRowsSqlViewMapping.obito_data_obito.index ],
          obito_local_ocorrencia_id: record[ importRowsSqlViewMapping.obito_local_ocorrencia_id.index ],
          obito_causa_basica: record[ importRowsSqlViewMapping.obito_causa_basica.index ],
          obito_causa_directa: record[ importRowsSqlViewMapping.obito_causa_directa.index ],
          obito_causa_intermedia: record[ importRowsSqlViewMapping.obito_causa_intermedia.index ],
          obito_tipo_obito_id: record[ importRowsSqlViewMapping.obito_tipo_obito_id.index ],
          obito_tipo_obito_fetal_id: record[ importRowsSqlViewMapping.obito_tipo_obito_fetal_id.index ],
          obito_morte_durante_o_parto_id: record[ importRowsSqlViewMapping.obito_morte_durante_o_parto_id.index ],
          obito_morte_apos_o_parto_id: record[ importRowsSqlViewMapping.obito_morte_apos_o_parto_id.index ],
          obito_autopsia_id: record[ importRowsSqlViewMapping.obito_autopsia_id.index ],
          obito_created: record[ importRowsSqlViewMapping.obito_created.index ],
          obito_modified: record[ importRowsSqlViewMapping.obito_modified.index ]
        },
        individuo: {
          individuo_id_individuos: record[ importRowsSqlViewMapping.individuo_id_individuos.index ],
          individuo_obito_id: record[ importRowsSqlViewMapping.individuo_obito_id.index ],
          individuo_nid: record[ importRowsSqlViewMapping.individuo_nid.index ],
          individuo_data_nascimento: record[ importRowsSqlViewMapping.individuo_data_nascimento.index ],
          individuo_raca_id: record[ importRowsSqlViewMapping.individuo_raca_id.index ],
          individuo_sexo_id: record[ importRowsSqlViewMapping.individuo_sexo_id.index ],
          individuo_provincia_id: record[ importRowsSqlViewMapping.individuo_provincia_id.index ],
          individuo_nacionalidade: record[ importRowsSqlViewMapping.individuo_nacionalidade.index ],
          individuo_individuo_id: record[ importRowsSqlViewMapping.individuo_individuo_id.index ],
          individuo_created: record[ importRowsSqlViewMapping.individuo_created.index ],
          individuo_modified: record[ importRowsSqlViewMapping.individuo_modified.index ]
        },
        internamento: {
          internamento_id_internamentos: record[ importRowsSqlViewMapping.internamento_id_internamentos.index ],
          internamento_hospital_id: record[ importRowsSqlViewMapping.internamento_hospital_id.index ],
          internamento_data_internamento: record[ importRowsSqlViewMapping.internamento_data_internamento.index ],
          internamento_hora_internamento: record[ importRowsSqlViewMapping.internamento_hora_internamento.index ],
          internamento_servico_id: record[ importRowsSqlViewMapping.internamento_servico_id.index ],
          internamento_tipo_admissao_id: record[ importRowsSqlViewMapping.internamento_tipo_admissao_id.index ],
          internamento_obito_id: record[ importRowsSqlViewMapping.internamento_obito_id.index ],
          internamento_created: record[ importRowsSqlViewMapping.internamento_created.index ],
          internamento_modified: record[ importRowsSqlViewMapping.internamento_modified.index ]
        },
        fetal: {
          fetal_id_fetais: record[ importRowsSqlViewMapping.fetal_id_fetais.index ],
          fetal_idade_mae: record[ importRowsSqlViewMapping.fetal_idade_mae.index ],
          fetal_filhos_nascidos_vivos: record[ importRowsSqlViewMapping.fetal_filhos_nascidos_vivos.index ],
          fetal_filhos_nascidos_mortos: record[ importRowsSqlViewMapping.fetal_filhos_nascidos_mortos.index ],
          fetal_gestacao_periodo_id: record[ importRowsSqlViewMapping.fetal_gestacao_periodo_id.index ],
          fetal_tipo_parto_id: record[ importRowsSqlViewMapping.fetal_tipo_parto_id.index ],
          fetal_morte_parto_id: record[ importRowsSqlViewMapping.fetal_morte_parto_id.index ],
          fetal_obito_id: record[ importRowsSqlViewMapping.fetal_obito_id.index ],
          fetal_created: record[ importRowsSqlViewMapping.fetal_created.index ],
          fetal_modified: record[ importRowsSqlViewMapping.fetal_modified.index ]
        },
        hospital: {
          hospital_id_hospitais: record[ importRowsSqlViewMapping.hospital_id_hospitais.index ],
          hospital_codigo_hospital: record[ importRowsSqlViewMapping.hospital_codigo_hospital.index ],
          hospital_nome_hospital: record[ importRowsSqlViewMapping.hospital_nome_hospital.index ],
          hospital_distrito_id: record[ importRowsSqlViewMapping.hospital_distrito_id.index ],
          hospital_nivel_hospital: record[ importRowsSqlViewMapping.hospital_nivel_hospital.index ],
          hospital_n_arquivo: record[ importRowsSqlViewMapping.hospital_n_arquivo.index ],
          hospital_created: record[ importRowsSqlViewMapping.hospital_created.index ],
          hospital_modified: record[ importRowsSqlViewMapping.hospital_modified.index ]
        },
        endereco: {
          endereco_id_enderecos: record[ importRowsSqlViewMapping.endereco_id_enderecos.index ],
          endereco_provincia_id: record[ importRowsSqlViewMapping.endereco_provincia_id.index ],
          endereco_distrito_id: record[ importRowsSqlViewMapping.endereco_distrito_id.index ],
          endereco_individuo_id: record[ importRowsSqlViewMapping.endereco_individuo_id.index ],
          endereco_localidade: record[ importRowsSqlViewMapping.endereco_localidade.index ],
          endereco_bairro: record[ importRowsSqlViewMapping.endereco_bairro.index ],
          endereco_created: record[ importRowsSqlViewMapping.endereco_created.index ],
          endereco_modified: record[ importRowsSqlViewMapping.endereco_modified.index ]
        }
      }
    }
  }

});