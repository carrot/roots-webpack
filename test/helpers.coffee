path = require 'path'
fs = require 'fs'
util = require 'util'
acorn = require 'acorn'

module.exports = should.matchExpected = (target) ->
  parser = acorn.parse
  _path = target.split('public')
  expectedPath = path.join(_path[0], 'expected', _path[1])

  fs.existsSync(expectedPath).should.be.ok
  expected = parser(fs.readFileSync(expectedPath, 'utf8'))
  results = parser(fs.readFileSync(target, 'utf8') + '\n')

  JSON.stringify(results).should.eql(
    JSON.stringify(expected),
    "expected output doesn't match"
  )
