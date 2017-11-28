const fetch = require('node-fetch')

exports.getAuthBasicValue = function (username, password) {
  const buf = Buffer.from(`${username}:${password}`)
  return `Basic ${buf.toString('base64')}`
}

exports.fetchWrapper = async function (url, options = {}) {
  if (options.body != null && typeof options.body !== 'string') {
    options.body = JSON.stringify(options.body)
    if (options.headers == null) {
      options.headers = {}
    }
  }

  const resp = await fetch(url, options).then(resp => {
    console.log('Resource data fetched...')
    return resp
  }).catch(err => {
    throw new Error(err.stack)
  })

  return resp.json()
}
