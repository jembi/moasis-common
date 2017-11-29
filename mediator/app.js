'use strict'

const express = require('express')
const router = require('./request-router')

const app = express()

app.use('/', router)
app.use(express.static('public'))

app.listen(4000, function () {
  console.log('Listening on port 4000... ')
})

module.exports = exports = app
