'use strict'

const express = require('express')
const router = require('./request-router')
const database = require('./database')

const app = express()

database.initialize()

app.use('/', router)

app.listen(4000, function () {
  console.log('Listening on port 4000... ')
})

process.on('SIGINT', () => {
  console.log('Closed db...')
  database.client.end()
  process.exit(1)
})

module.exports = exports = app
