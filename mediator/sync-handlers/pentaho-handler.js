'use strict'

const request = require('request-promise')
const database = require('../database')

exports.handleTestRequest = (req, res, next) => {
  res.sendStatus(200)
}

exports.handleSyncRequest = (req, res, next) => {
  let options = {
    uri: 'http://resourcemap:3000/collections/1/sites.json'
  }

  request(options)
    .then((body) => {
      console.log(body.sites)
      console.log(body.total_count)

      // save sites in postgres
      // let facilities = body.sites

      // facilities.forEach((item) => {
      //   database.client.query('INSERT ')
      // })

      res.sendStatus(200)
    })
    .catch((err) => {
      if (err) {
        console.log(err)
        res.sendStatus(403)
      }
    })
}
