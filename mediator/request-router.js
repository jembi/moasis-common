'use strict'

const {Router} = require('express')
const dhisHandler = require('./sync-handlers/dhis-handler')
const pentahoHandler = require('./sync-handlers/pentaho-handler')

const router = Router()

router.get('/', (req, res, next) => { res.sendStatus(200) })

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

module.exports = exports = router
