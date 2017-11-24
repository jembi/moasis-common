const postgres = require('pg')
const connectionString = process.env.DATABASE_URL || 'postgres://database:5432/pentaho'

const client = new postgres.Client(connectionString)

exports.initialize = () => {
  client.connect()

  client.query('CREATE TABLE IF NOT EXISTS Facilities(id int(11), name varchar(255), uuid varchar(255), properties text, lat decimal(10, 6), lng decimal(10, 6))')
  // client.query('CREATE TABLE IF NOT EXISTS DataValues()')
}

exports.close = () => {
  client.end()
}

exports.client = client
