const utils = require('../utils')
const config = require('../config')

const dhisBaseUrl = config.get('dhis:rootUrl')
const dhisUser = config.get('dhis:user')
const dhisPassword = config.get('dhis:pass')

const dhisHeaders = {
  Authorization: utils.getAuthBasicValue(dhisUser, dhisPassword)
}

exports.fetchDhis = async function (path, options = {}) {
  const dhisOptions = Object.assign({}, { headers: dhisHeaders }, options)
  dhisOptions.headers['Content-Type'] = 'application/json'
  dhisOptions.headers['Accept'] = 'application/json'
  const requestUrl = dhisBaseUrl + '/' + path
  return await utils.fetchWrapper(requestUrl, dhisOptions)
}
