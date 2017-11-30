'use strict'

const {Router} = require('express')
const cors = require('cors')
const pentahoHandler = require('./sync-handlers/pentaho-handler')
const resourcemapHandler = require('./sync-handlers/resource-map-handler')
const exportHandler = require('./export-handler')
const request = require('request-promise-native')

const router = Router()
router.use(cors())

router.get(
    '/dhis/sync',
    resourcemapHandler.syncResourcemap
)

// Pentaho endpoints
router.get(
    '/pentaho/test',
    pentahoHandler.handleTestRequest
)
router.get(
    '/pentaho/sync',
    pentahoHandler.handleSyncRequest
)

router.get(
  '/export',
  exportHandler.handleExport
)

router.get(
  '/orgUnits',
  (req, res, next) => {
    request({
      method: 'GET',
      url: 'http://openhim-core:5001/api/organisationUnits?paging=false',
      json: true
    }).then((response) => {
      res.status(200).send(response.organisationUnits)
    }).catch(next)
  }
)

router.get(
  '/dataSets',
  (req, res, next) => {
    request({
      method: 'GET',
      url: 'http://openhim-core:5001/api/dataSets?paging=false',
      json: true
    }).then((response) => {
      res.status(200).send(response.dataSets)
    }).catch(next)
  }
)

module.exports = exports = router
