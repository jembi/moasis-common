'use strict'

const {Pool} = require('pg')

const pool = new Pool()

pool
  .query(
    `CREATE TABLE IF NOT EXISTS data_values (
      id SERIAL,
      data_element VARCHAR(255),
      org_unit VARCHAR(255),
      period VARCHAR(255),
      value VARCHAR(255),
      export_id UUID
    )`
  )
  .then(() => {
    console.log('Created "data_values" table...')
  })
  .catch(console.error)

pool
  .query(
    `CREATE TABLE IF NOT EXISTS Health_Facilities(
      id integer PRIMARY KEY,
      name varchar(255),
      uuid varchar(255),
      properties text,
      lat decimal,
      lng decimal
    )`
  )
  .then(() => {
    console.log('Created "Health_Facilities" table...')
  })
  .catch(console.error)

module.exports = exports = {
  query: (...args) => {
    return pool.query(...args)
  }
}
