
app.factory('Api', function ($rootScope, $resource, CONFIG) {

  return {

    OrgUnit: $resource( '/api/organisationUnits/:uid.json', { uid: '@_uid' }),

    OrgUnitLevels: $resource( '/api/metaData/?assumeTrue=false&organisationUnitLevels=true', {}),

    CurrentUser: $resource( '/api/me', {}),

    SqlView: $resource( '/api/sqlViews/:uid/data.json', { uid: '@_uid' }),

    Rerun: $resource( CONFIG.importServiceUrl + '/rerun', {}),

  };

});
