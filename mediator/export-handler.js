'use strict'

const db = require('./db')
const request = require('request-promise-native')
const format = require('pg-format')
const uuid = require('uuid/v4')

async function searchDataValues (query) {
  return request({
    method: 'GET',
    url: 'http://openhim-core:5001/api/dataValueSets',
    qs: query,
    auth: {
      user: 'admin',
      pass: 'district'
    },
    json: true
  })
}

async function getOrgUnitName (uid, next) {
  return request({
    method: 'GET',
    url: `http://openhim-core:5001/api/organisationUnits/${uid}`,
    json: true
  })
}

async function getDataElementName (uid, next) {
  return request({
    method: 'GET',
    url: `http://openhim-core:5001/api/dataElements/${uid}`,
    json: true
  })
}

async function exportDataValues (dataValues) {
  if (!Array.isArray(dataValues) || dataValues.length === 0) {
    // No data values
    return []
  }
  const exportId = uuid()
  console.log(`Performing export "${exportId}"`)
  const rows = await Promise.all(dataValues.map(async (dataValue) => {
    const dataElement = await getDataElementName(dataValue.dataElement)
    const orgUnit = await getOrgUnitName(dataValue.orgUnit)
    return [
      dataElement.name,
      orgUnit.name,
      dataValue.period,
      dataValue.value,
      dataValue.created,
      exportId
    ]
  }))
  const query = format(
    'INSERT INTO data_values (data_element, org_unit, period, value, created, export_id) VALUES %L RETURNING *',
    rows
  )
  return db.query(query).then(result => result.rows)
}

exports.handleExport = async (req, res, next) => {
  try {
    const searchResponse = await searchDataValues(req.query)
    const dataValues = await exportDataValues(searchResponse.dataValues)

    res.status(200).attachment('export.json').send(dataValues)
  } catch (err) {
    if (err.statusCode && err.statusCode < 500) {
      console.error(err)
      return res.status(err.statusCode).send(err.error)
    }
    next(err)
  }
}
