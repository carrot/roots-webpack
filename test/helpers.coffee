path = require 'path'
fs = require 'fs'
util = require 'util'

module.exports = ->

  should.matchExpected = (target) ->
    parser = (require('acorn')).parse

    _path = target.split('public')
    expectedPath = path.join _path[0], 'expected', _path[1]

    extension = ".#{str.split('.')[1]}"

    fs.existsSync(expectedPath).should.be.ok
    expected = parser(fs.readFileSync(expectedPath, 'utf8'))
    results = parser(target)
    util.inspect(results).should.eql(
      util.inspect(expected),
      "expected output doesn't match"
    )
