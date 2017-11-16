'use strict'

const {Router} = require('express')
const dhisHandler = require('./sync-handlers/dhis-handler')
const pentahoHandler = require('./sync-handlers/pentaho-handler')

const router = Router()

router.get(
    '/dhis/test',
    dhisHandler.handleRequest
)
router.get(
    '/pentaho/test',
    pentahoHandler.handleRequest
)

module.exports = exports = router
