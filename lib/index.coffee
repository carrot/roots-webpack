path           = require 'path'
RootsUtil      = require 'roots-util'
webpack        = require 'webpack'
{EventEmitter} = require 'events'

module.exports = (opts) ->
  if not opts.output then throw new Error('output option is required')

  initialized = false
  compiler = null
  emitter = new EventEmitter

  class RootsWebpack

    constructor: (@roots) ->
      if not initialized
        opts.context = @roots.root
        opts.output = path.join(@roots.config.output_path(), opts.output)
        compiler = webpack(opts)
        compiler.watch opts.watchDelay or 200, (err, stats) ->
          if err then return emitter.emit('err', err)
          emitter.emit('stats', stats)

        # debug
        emitter.on('err', console.error)
        emitter.on('stats', console.log)