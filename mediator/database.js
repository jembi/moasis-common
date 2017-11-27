const postgres = require('pg')

const client = new postgres.Client()

exports.initialize = () => {
  client.connect()

  client.query('CREATE TABLE IF NOT EXISTS MD_Facilities(id integer, name varchar(255), uuid varchar(255), properties text, lat decimal, lng decimal)')
    .then(res => console.log('MD_Facilities table created...'))
    .catch(err => console.error(err.stack))
  // client.query('CREATE TABLE IF NOT EXISTS DataValues()')
}

exports.client = client
