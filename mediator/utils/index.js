const config = require('../config')
const dhisBaseUrl = config.get('dhis:rootUrl')
const dhisUser = config.get('dhis:user')
const dhisPassword = config.get('dhis:pass')
const resourceMapBaseUrl = config.get('resourceMap:rootUrl')
const resourceMapUser = config.get('resourceMap:user')
const resourceMapPassword = config.get('resourceMap:pass')
const fetch = require('node-fetch')

exports.getAuthBasicValue = function (username, password) {
    const buf = Buffer.from(`${username}:${password}`)
    return `Basic ${buf.toString('base64')}`
}

exports.fetchWrapper = async function (url, options = {}) {
    if (options.body != null && typeof options.body !== 'string') {
        options.body = JSON.stringify(options.body)
        if (options.headers == null) {
            options.headers = {}
        }
    }
    const resp = await fetch(url, options)
    if (!resp.ok) {
        throw new Error(`Got a ${resp.status} when calling ${url}`)
    }
    return resp.json()
}


