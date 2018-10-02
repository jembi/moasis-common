'use strict'

const db = require('./db')
const request = require('request-promise-native')
const format = require('pg-format')
const uuid = require('uuid/v4')
const Moment = require('moment')
const { extendMoment } = require('moment-range')
const moment = extendMoment(Moment)

// async function searchDataValues (query) {
//   return request({
//     method: 'GET',
//     url: 'http://openhim-core:5001/api/dataValueSets',
//     qs: query,
//     auth: {
//       user: 'admin',
//       pass: 'district'
//     },
//     json: true
//   })
// }

async function searchIndicatorValues (query) {
  const range = Array.from(moment.range(query.startDate, query.endDate).by('month')).map(m => m.format('YYYYMM')).reduce((result, m) => { return result + ';' + m })

  return request({
    method: 'GET',
    url: `http://openhim-core:5001/api/analytics?dimension=dx:IN_GROUP-${query.indicatorGroup}&dimension=pe:${range}&dimension=ou:${query.orgUnit}&aggregationType=SUM`,
    json: true
  })
}

// async function getOrgUnitName (uid, next) {
//   return request({
//     method: 'GET',
//     url: `http://openhim-core:5001/api/organisationUnits/${uid}`,
//     json: true
//   })
// }

// async function getDataElementName (uid, next) {
//   return request({
//     method: 'GET',
//     url: `http://openhim-core:5001/api/dataElements/${uid}`,
//     json: true
//   })
// }

// async function exportDataValues (dataValues) {
//   if (!Array.isArray(dataValues) || dataValues.length === 0) {
//     // No data values
//     return []
//   }
//   const exportId = uuid()
//   console.log(`Performing export "${exportId}"`)
//   const rows = await Promise.all(dataValues.map(async (dataValue) => {
//     const dataElement = await getDataElementName(dataValue.dataElement)
//     const orgUnit = await getOrgUnitName(dataValue.orgUnit)
//     return [
//       dataElement.name,
//       orgUnit.name,
//       dataValue.period,
//       dataValue.value,
//       dataValue.created,
//       exportId
//     ]
//   }))
//   const query = format(
//     'INSERT INTO data_values (data_element, org_unit, period, value, created, export_id) VALUES %L RETURNING *',
//     rows
//   )
//   return db.query(query).then(result => result.rows)
// }

async function exportIndicatorValues (response) {
  const insertQry = `INSERT INTO data_values (
    org_unit,
    indicator,
    period,
    value,
    created
  ) VALUES($1, $2, $3, $4, $5)`

  for (let i = 0; i < response.rows.length; i++) {
    let values = [
      response.metaData.items[response.rows[i][2]].name,
      response.metaData.items[response.rows[i][0]].name,
      response.rows[i][1],
      response.rows[i][3],
      moment().format()
    ]

    db.query(insertQry, values)
  }
  console.log('Indicators exported...')
  return
}

exports.handleExport = async (req, res, next) => {
  try {
    req.query.startDate = moment(req.query.startDate)
    req.query.endDate = moment(req.query.endDate)

    const searchResponse = await searchIndicatorValues(req.query)
    await exportIndicatorValues(searchResponse)

    res.status(200).attachment('export.json').send(JSON.stringify({msg: 'Data exported'}))
  } catch (err) {
    if (err.statusCode && err.statusCode < 500) {
      console.error(err)
      return res.status(err.statusCode).send(err.error)
    }
    next(err)
  }
}
