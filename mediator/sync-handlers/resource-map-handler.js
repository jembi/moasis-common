const utils = require('../utils')
const config = require('../config')
const FormData = require('form-data')
const fetch = require('node-fetch')
const path = require('path')

const resourceMapBaseUrl = config.get('resourceMap:rootUrl')
const resourceMapUser = config.get('resourceMap:user')
const resourceMapPassword = config.get('resourceMap:pass')
const dhisHandler = require('./dhis-handler')
const dhisBaseUrl = config.get('dhis:rootUrl')


const resourceMapHeaders = {
    Authorization: utils.getAuthBasicValue(resourceMapUser, resourceMapPassword)
}

async function fetchResourceMap(path, options = {}) {
    const resourceOptions = Object.assign({}, { headers: resourceMapHeaders }, options)
    const requestUrl = resourceMapBaseUrl + '/' + path + '.json'
    return utils.fetchWrapper(requestUrl, resourceOptions)
}

async function updateSiteProperty(path, options = {}) {
    const resourceOptions = Object.assign({}, { headers: resourceMapHeaders }, options)
    const requestUrl = resourceMapBaseUrl + '/' + path
    return utils.fetchWrapper(requestUrl, resourceOptions)
}

exports.syncResourcemap = async function () {
    const collections = await fetchResourceMap('api/collections')
    const collectionsResults = await (Promise.all(collections.map(async col => {
        const result = await fetchResourceMap(`api/collections/${col.id}`)
        result.id = col.id
        return result
    })))

    const colsWithoutIds = collectionsResults.map(c => ({
        ...c,
        sites: c.sites.filter(({ properties = {} }) => properties.dhis2_id == null)
    }))
        .filter(c => c.sites.length > 0)
    for (const collectionId of collectionsResults) {
        const es_code = await fetchResourceMap(`api/collections/${collectionId.id}/fields/mapping`)
        const updatedSites = await insertSites(colsWithoutIds, es_code[0].id)
    }
}

async function insertSites(colsWithoutIds, es_code) {
    for (const col of colsWithoutIds) {
        for (const site of col.sites) {
            debugger
            const { response: { uid: dhis2_id } } = await dhisHandler.fetchDhis('api/organisationUnits', {
                method: 'POST',
                body: {
                    name: site.name,
                    shortName: site.name,
                    openingDate: site.createdAt,
                    latitude: site.lat,
                    longitude: site.long
                }
            })
            let qs = `?es_code=${es_code}&value=${dhis2_id}`
            const mapUpdate = await updateSiteProperty(`api/sites/${site.id}/update_property${qs}`, {
                method: 'POST'
            })
        }
    }
}
