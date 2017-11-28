const utils = require('../utils')
const config = require('../config')
const resourceMapHandler = require('./resource-map-handler')
const FormData = require('form-data')
const fetch = require('node-fetch')
const path = require('path')

const dhisHeaders = {
    Authorization: utils.getAuthBasicValue(utils.dhisUser, utils.dhisPassword)
}

exports.fetchDhis = async function (path, options = {}) {
    const dhisOptions = Object.assign({}, { headers: dhisHeaders }, options)
    dhisOptions.headers['Content-Type'] = 'application/json'
    dhisOptions.headers['Accept'] = 'application/json'
    const requestUrl = dhisBaseUrl + '/' + path
    return utils.fetchWrapper(requestUrl, dhisOptions)
}