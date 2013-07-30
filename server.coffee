restify = require 'restify'
nodeio  = require 'node.io'

android = require "#{__dirname}/node-io/android.coffee"

server = restify.createServer()
server.use restify.queryParser({ mapParams: false })
server.get '/', (req, res, next) ->
  return res.send 500, 'missing bundleIdentifier' if !req.query.bundleId
    
  opt = { "args": [req.query.bundleId, req.query.lang] }
  nodeio.start new android.class, opt, (err, output) ->
    return res.send 500, err if err 

    json = JSON.stringify(output[0]) || ''
    res.writeHead 200, { 'Content-Type': 'application/json;charset=utf-8' }
    res.write json
    res.end()
  , true

server.listen (process.env.PORT || 8080), ->
  console.log "#{server.name} listening at #{server.url}"