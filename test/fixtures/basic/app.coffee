webpack = require '../../..'

module.exports =
  ignores: ["**/_*", "**/.DS_Store"]
  extensions: [webpack(entry: 'index.js', output: 'bundle.js')]