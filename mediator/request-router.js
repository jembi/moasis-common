'use strict'

const {Router} = require('express')
const dhisHandler = require('./sync-handlers/dhis-handler')
const pentahoHandler = require('./sync-handlers/pentaho-handler')
const resourcemapHandler = require('./sync-handlers/resource-map-handler')

const router = Router()

router.get(
    '/dhis/test',
    resourcemapHandler.syncResourcemap
)
router.get(
    '/pentaho/test',
    pentahoHandler.handleRequest
)

module.exports = exports = router
