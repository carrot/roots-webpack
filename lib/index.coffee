path           = require 'path'
RootsUtil      = require 'roots-util'
webpack        = require 'webpack'
{EventEmitter} = require 'events'

module.exports = (opts) ->
  if opts.filename? then opts.filename = 'bundle.js'

  webpackInitialized = false
  compiler = null
  emitter = new EventEmitter

  class RootsWebpack

    constructor: (@roots) ->
      if not webpackInitialized
        webpackInitialized = true
        opts.context = @roots.root
        opts.output.path = path.join(@roots.config.output_path())
        compiler = webpack(opts)

        compiler.watch opts.watchDelay or 200, (err, stats) ->
          if err then return throw new Error err
          else if (statsJson = stats.toJson()).errors.length > 0
            for error of statsJson.errors
              throw new Error error
          else if statsJson.warnings.length > 0
            for error of statsJson.warnings
              throw new Error error
          else return
