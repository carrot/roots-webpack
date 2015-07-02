path           = require 'path'
RootsUtil      = require 'roots-util'
webpack        = require 'webpack'
{EventEmitter} = require 'events'

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
        _roots = @roots

        compiler.watch opts.watchDelay or 200, (err, stats) ->
          emitter.emit('fileDeps', stats.compilation.fileDependencies)

          if err
            throw new Error(err)
          else if (statsJson = stats.toJson()).errors.length > 0
            throw new Error(error) for i, error of statsJson.errors
          else if statsJson.warnings.length > 0
            throw new Error(error) for i, error of statsJson.warnings

      emitter.on('fileDeps', (deps) ->
        Array.prototype.push.apply(_roots.config.ignores, deps)
      )
