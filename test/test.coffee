path      = require 'path'
Roots     = require 'roots'
require './helpers'

# setup, teardown, and utils

compile_fixture = (fixture_name, done) ->
  @public = path.join(_path, fixture_name, 'public')
  h.project.compile(Roots, fixture_name).then(-> done())

before (done) -> h.project.install_dependencies('*', done)
after -> h.project.remove_folders('**/public')

# tests

describe 'basic', ->

  before (done) -> compile_fixture.call(@, 'basic', done)

  it 'compiles a basic bundle', ->
    p = path.join(@public, 'bundle.js')
    p.should.be.a.file()
    should.matchExpected(p)


describe 'css', ->

  before (done) -> compile_fixture.call(@, 'css-bundle', done)

  it 'compiles a css bundle', ->
    p = path.join(@public, 'bundle.js')
    p.should.be.a.file()
    should.matchExpected(p)
