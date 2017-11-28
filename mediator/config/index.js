const fs = require('fs')
const nconf = require('nconf')
const {path:appRoot} = require('app-root-path')
const path = require('path')

nconf
.argv()
.env()
.file(path.join(appRoot, 'config', 'default.json'))

module.exports = nconf