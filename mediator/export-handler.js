'use strict'

const db = require('./db')
const request = require('request-promise-native')
const format = require('pg-format')
const uuid = require('uuid/v4')

function searchDataValues(query) {
  return request({
    method: 'GET',
    url: 'http://dhis2-web:8080/api/dataValueSets',
    qs: query,
    auth: {
      user: 'admin',
      pass: 'district'
    },
    json: true
  })
}

function exportDataValues(dataValues) {
  if (!Array.isArray(dataValues) || dataValues.length === 0) {
    // No data values
    return []
  }
  const exportId = uuid()
  console.log(`Performing export "${exportId}"`)
  const rows = dataValues.map(dataValue => [
    dataValue.dataElement,
    dataValue.orgUnit,
    dataValue.period,
    dataValue.value,
    exportId
  ])
  const query = format(
    'INSERT INTO data_values (data_element, org_unit, period, value, export_id) VALUES %L RETURNING *',
    rows
  )
  return db.query(query).then(result => result.rows)
}

exports.handleExport = (req, res, next) => {
  searchDataValues(req.query)
    .then(response => exportDataValues(response.dataValues))
    .then(dataValues => {
      res.status(200).attachment('export.json').send(dataValues)
    })
    .catch(err => {
      if (err.statusCode && err.statusCode < 500) {
        console.error(err)
        return res.status(err.statusCode).send(err.error)
      }
      next(err)
    })
}
