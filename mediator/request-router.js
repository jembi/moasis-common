'use strict'

const {Router} = require('express')
const cors = require('cors')
const dhisHandler = require('./sync-handlers/dhis-handler')
const pentahoHandler = require('./sync-handlers/pentaho-handler')
const exportHandler = require('./export-handler')

const router = Router()

router.get(
    '/dhis/test',
    dhisHandler.handleRequest
)
router.get(
    '/pentaho/test',
    pentahoHandler.handleRequest
)
router.get(
  '/export',
  cors(),
  exportHandler.handleExport
)

module.exports = exports = router
