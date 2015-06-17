webpack = require '../../..'
ExtractTextPlugin = require "extract-text-webpack-plugin"

webPackConfig =
  entry: './main'
  output:
    filename: 'bundle.js'
  module:
    loaders: [
      {
        test: /\.css$/,
        loader: ExtractTextPlugin.extract("css-loader")
      },
      {
        test: /\.png$/,
        loader: "file-loader"
      }
    ]
  plugins: [new ExtractTextPlugin("style.css", { allChunks: true })]

module.exports =
  ignores: ["**/_*", "**/.DS_Store"]
  extensions: [webpack()]
