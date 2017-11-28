'use strict'

const {Router} = require('express')
const cors = require('cors')
const dhisHandler = require('./sync-handlers/dhis-handler')
const pentahoHandler = require('./sync-handlers/pentaho-handler')
const exportHandler = require('./export-handler')
const request = require('request-promise-native')

const router = Router()
router.use(cors())

router.get(
    '/dhis/test',
    dhisHandler.handleRequest
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
      url: 'http://admin:district@dhis-web:8080/api/organisationUnits?paging=false',
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
      url: 'http://admin:district@dhis-web:8080/api/dataSets?paging=false',
      json: true
    }).then((response) => {
      res.status(200).send(response.dataSets)
    }).catch(next)
  }
)

module.exports = exports = router
