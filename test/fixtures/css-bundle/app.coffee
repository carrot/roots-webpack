webpack = require '../../..'
ExtractTextPlugin = require "extract-text-webpack-plugin"

module.exports =
  ignores: ["**/_*", "**/.DS_Store"]
  extensions: [
    webpack(
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
    )
  ]
