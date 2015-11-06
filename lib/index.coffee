path           = require 'path'
RootsUtil      = require 'roots-util'
webpack        = require 'webpack'
{EventEmitter} = require 'events'
_              = require 'lodash'

module.exports = (opts) ->
  if opts.filename? then opts.filename = 'bundle.js'
  
  webpack_initialized = false
  compiler = null
  emitter = new EventEmitter

  class RootsWebpack

    constructor: (@roots) ->
      if not webpack_initialized
        webpack_initialized = true
        opts.context = @roots.root
        opts.output.path = path.join(@roots.config.output_path())
        compiler = webpack(opts)
        
        callback = (err, stats) ->
          if err then throw new Error(err)
          else if (statsJson = stats.toJson()).errors.length > 0
            throw new Error(error) for i, error of statsJson.errors
          else if statsJson.warnings.length > 0
            throw new Error(error) for i, error of statsJson.warnings
        
        # Temporary solution to define if user is watching `roots watch` or
        # compiling `roots compile` the project. This solves a hang up from
        # webpack if `roots compile` is used.
        unless _.isUndefined @roots._events
          compiler.watch(opts.watchDelay or 200, callback)
        else compiler.run(callback)
