path           = require 'path'
RootsUtil      = require 'roots-util'
webpack        = require 'webpack'
{EventEmitter} = require 'events'

module.exports = (opts) ->
  if not opts.filename then opts.filename = 'bundle.js'

  initialized = false
  compiler = null
  emitter = new EventEmitter

  class RootsWebpack

    constructor: (@roots) ->
      if not initialized
        initialized = true
        opts.context = @roots.root
        opts.output.path = path.join(@roots.config.output_path())
        compiler = webpack(opts)

        compiler.watch opts.watchDelay or 200, (err, stats) ->
          if err then return console.error('ERROR: ', err)
          console.log('STATS: ', stats.toJson())

        # debug
        emitter.on('err', console.error)
        emitter.on('stats', console.log)
