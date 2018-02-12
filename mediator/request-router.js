'use strict'

const {Router} = require('express')
const cors = require('cors')
const moment = require('moment')
const pentahoHandler = require('./sync-handlers/pentaho-handler')
const resourcemapHandler = require('./sync-handlers/resource-map-handler')
const exportHandler = require('./export-handler')
const request = require('request-promise-native')
const db = require('./db')

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

router.get(
  '/indicatorGroups',
  (req, res, next) => {
    request({
      method: 'GET',
      url: 'http://dhis2-web:8080/api/indicatorGroups?paging=false',
      headers: {
        'Authorization': 'Basic ' + new Buffer('admin:district').toString('base64')
      },
      json: true
    }).then((response) => {
      res.status(200).send(response.indicatorGroups)
    }).catch(next)
  }
)

router.get(
  '/getAggregateValues',
  (req, res, next) => {
    request({
      method: 'GET',
      url: 'http://dhis2-web:8080/api/indicatorGroups',
      headers: {
        'Authorization': 'Basic ' + new Buffer('admin:district').toString('base64')
      },
      json: true
    }).then((responseGroup) => {
      request({
        method: 'GET',
        url: `http://dhis2-web:8080/api/analytics?dimension=dx:IN_GROUP-${responseGroup.indicatorGroups[0].id}&dimension=pe:LAST_12_MONTHS&aggregationType=SUM`,
        headers: {
          'Authorization': 'Basic ' + new Buffer('admin:district').toString('base64')
        },
        json: true
      }).then((response) => {
        const insertQry = `INSERT INTO aggregate_values (
            period,
            consultasexternas,
            hivtarv,
            created
          ) VALUES($1, $2, $3, $4)`

        for (let i = 0; i < response.rows.length; i++) {
          let values = []

          if (response.metaData.items[response.rows[i][0]].name.indexOf('HIV') > -1) {
            values = [
              response.rows[i][1],
              null,
              response.rows[i][2],
              moment().format()
            ]
          } else if (response.metaData.items[response.rows[i][0]].name.indexOf('Consultas') > -1) {
            values = [
              response.rows[i][1],
              response.rows[i][2],
              null,
              moment().format()
            ]
          }

          db.query(insertQry, values)
        }
        console.log('DHIS Aggregate values exported.')

        res.status(200).send({ msg: 'success' })
      }).catch(next)
    }).catch(next)
  }
)

router.get(
  '/healthFacilities',
  (req, res, next) => {
    db.query('SELECT id, name, created, lat, lng FROM Health_Facilities')
      .then(result => res.status(200).send(result.rows))
      .catch(next)
  }
)

router.get(
  '/dataValues',
  (req, res, next) => {
    db.query('SELECT id, org_unit, indicator, period, value, created FROM data_values')
      .then(result => res.status(200).send(result.rows))
      .catch(next)
  }
)

router.get(
  '/aggregateValues',
  (req, res, next) => {
    db.query('SELECT period, sum(consultasexternas) as consultasexternas, sum(hivtarv) as hivtarv FROM aggregate_values group by period')
      .then(result => res.status(200).send(result.rows))
      .catch(next)
  }
)

module.exports = exports = router
