Roots-webpack
=============================

[![npm](https://badge.fury.io/js/roots-webpack.svg?style=flat)](http://badge.fury.io/js/roots-webpack) [![tests](https://badge.fury.io/travis/carrot/roots-webpack/master.svg?style=flat)](https://travis-ci.org/carrot/roots-webpack) [![dependencies](https://badge.fury.io/gemnasium/carrot/roots-webpack.svg?style=flat)](https://gemnasium.com/carrot/roots-webpack) [![Coverage Status](https://img.shields.io/coveralls/carrot/roots-webpack.svg?style=flat)](https://coveralls.io/r/carrot/roots-webpack?branch=master)

Webpack as an asset pipeline for roots

> **Note:** This project is in early development, and versioning is a little different. [Read this](http://markup.im/#q4_cRZ1Q) for more details.

### Installation

- make sure you are in your roots project directory
- `npm install roots-webpack --save`
- modify your `app.coffee` file to include the extension, as such

  ```coffee
  rootsWebpack = require('roots-webpack')

  module.exports =
    extensions: [rootsWebpack()]
  ```

### Usage


### License & Contributing

- Details on the license [can be found here](LICENSE.md)
- Details on running tests and contributing [can be found here](contributing.md)