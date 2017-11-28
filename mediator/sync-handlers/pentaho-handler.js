'use strict'

const request = require('request-promise-native')
const database = require('../db')

// upsert query
const queryStr = `INSERT INTO Health_Facilities(
    id, name, uuid,
    properties,
    lat,
    lng
  ) VALUES($1, $2, $3, $4, $5, $6)
  ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    uuid = EXCLUDED.uuid,
    properties = EXCLUDED.properties,
    lat = EXCLUDED.lat,
    lng = EXCLUDED.lng
  RETURNING *`
let promises = []

exports.handleTestRequest = (req, res, next) => {
  console.log('Test request received...')
  res.sendStatus(200)
}

exports.handleSyncRequest = (req, res, next) => {
  const auth = 'Basic ' + new Buffer('test@resource.org:test').toString('base64')
  let options = {
    uri: 'http://openhim-core:5001/resourcemap',
    headers: {
      'Authorization': auth
    }
  }

  request(options)
    .then((body) => {
      let response = JSON.parse(body)
      console.log('Facilities pulled: ', response.total_count)

      // save sites in postgres
      let facilities = response.sites

      facilities.forEach((item) => {
        let values = [
          item.id,
          item.name,
          item.uuid,
          item.properties,
          item.lat,
          item.lng
        ]

        promises.push(database.client.query(queryStr, values))
      })

      Promise.all(promises)
        .then(response => {
          console.log('Facilities synced...')

          res.sendStatus(200)
        })
        .catch(e => {
          console.error(e.stack)
          res.sendStatus(500)
        })
    })
    .catch((err) => {
      if (err) {
        console.log(err)
        res.sendStatus(404)
      }
    })
}
