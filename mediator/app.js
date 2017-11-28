'use strict'

const express = require('express')
const router = require('./request-router')

const app = express()

app.use('/', router)

app.listen(3001, function () {
    console.log('Listening on port 3001... ')
})

module.exports = exports = app
