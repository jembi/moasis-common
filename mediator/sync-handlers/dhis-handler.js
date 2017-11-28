const utils = require('../utils')
const config = require('../config')
const resourceMapHandler = require('./resource-map-handler')
const FormData = require('form-data')
const fetch = require('node-fetch')
const path = require('path')

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
