const utils = require('../utils')
const config = require('../config')
const request = require('request-promise-native')

const resourceMapBaseUrl = config.get('resourceMap:rootUrl')
const resourceMapUser = config.get('resourceMap:user')
const resourceMapPassword = config.get('resourceMap:pass')
const dhisHandler = require('./dhis-handler')

const resourceMapHeaders = {
  Authorization: utils.getAuthBasicValue(resourceMapUser, resourceMapPassword)
}

async function fetchResourceMap (path, options = {}) {
  const resourceOptions = Object.assign({}, { headers: resourceMapHeaders }, options)
  const requestUrl = resourceMapBaseUrl + '/' + path + '.json'
  return utils.fetchWrapper(requestUrl, resourceOptions)
}

async function updateSiteProperty (path, options = {}) {
  const resourceOptions = Object.assign({}, { headers: resourceMapHeaders }, options)
  const requestUrl = resourceMapBaseUrl + '/' + path
  return utils.fetchWrapper(requestUrl, resourceOptions)
}

exports.syncResourcemap = async function (req, res, next) {
  try {
    await sync()
    res.sendStatus(200)
  } catch (err) {
    res.sendStatus(500)
  }
}

async function sync() {
  // Sync sites from RM with OrgUnits in DHIS
  const collections = await fetchResourceMap('api/collections')

  const collectionsResults = await (Promise.all(collections.map(async col => {
    const result = await fetchResourceMap(`api/collections/${col.id}`)
    result.id = col.id
    return result
  })))

  const colsWithoutIds = collectionsResults
    .map(c => ({
      ...c,
      sites: c.sites.filter(({ properties = {} }) => properties.dhis2_id == null)
    }))
    .filter(c => c.sites.length > 0)

  for (const collectionId of collectionsResults) {
    const layers = await fetchResourceMap(`api/collections/${collectionId.id}/fields/mapping`)
    const [dhis2_id] = layers.filter(el => el.code === 'dhis2_id')
    if (dhis2_id == null) {
      console.warn(`Couldn't find an dhis2_id for collection ${collectionId}, please ensure it's there.`)
      continue
    }
    await insertSites(colsWithoutIds, dhis2_id.id)
  }

  // sync OrgUnits from DHIS with facilities in RM
  const dhisResponse = await request({
    method: 'GET',
    url: `http://openhim-core:5001/api/organisationUnits/`,
    json: true
  })

  const rmResponse = await request({
    method: 'GET',
    url: 'http://openhim-core:5001/api/collections/1.json',
    headers: {
      'Authorization': 'Basic ' + new Buffer('root@openhim.org:pass').toString('base64')
    },
    json: true
  })

  dhisResponse.organisationUnits.forEach(async (facility) => {
    let insertFacility = true

    for (let i = 0; i < rmResponse.sites.length; i++) {
      console.log(rmResponse.sites[i])
      if (facility.id === rmResponse.sites[i].properties.dhis2_id) {
        console.log(`Facility ${facility.displayName} already exists in collection.`)
        insertFacility = false
        continue
      }
    }
    if (insertFacility) {
      await insertOrgUnit(facility)
    }
  })
}

async function insertOrgUnit (facility) {
  const formData = {
    name: facility.displayName,
    properties: {
      dhis2_id: facility.id
    }
  }

  try {
    await request({
      url: 'http://resourcemap_web_1:3000/api/collections/1/sites.json',
      method: 'POST',
      headers: {
        'Authorization': 'Basic ' + new Buffer('test@resource.org:test').toString('base64'),
        'Content-Type': 'multipart/form-data;'
      },
      formData: {
        name: 'site',
        site: JSON.stringify(formData)
      }
    })
    console.log(`Facility ${facility.displayName} inserted in collection.`)
  } catch (err) {
    console.log(err)
    throw Error(err)
  }
}

async function insertSites (colsWithoutIds, es_code) {
  for (const col of colsWithoutIds) {
    for (const site of col.sites) {
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
      await updateSiteProperty(`api/sites/${site.id}/update_property${qs}`, {
        method: 'POST'
      })
    }
  }
}
