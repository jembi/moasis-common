'use strict'

const {Router} = require('express')
const dhisHandler = require('./sync-handlers/dhis-handler')
const pentahoHandler = require('./sync-handlers/pentaho-handler')
const resourcemapHandler = require('./sync-handlers/resource-map-handler')

const router = Router()

router.get(
    '/dhis/test',
    dhisHandler.fetchDhis
)
router.get(
    '/pentaho/test',
    pentahoHandler.handleRequest
)

router.get(
    '/resourcemap/test',
    resourcemapHandler.syncResourcemap
)

module.exports = exports = router
