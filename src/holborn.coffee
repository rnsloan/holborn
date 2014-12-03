util = require('util')

constructor = (inputArray) ->
  if util.isArray(inputArray) is false
    throw new Error 'initialising array not passed in'

class Holborn
  constructor: constructor

module.exports = Holborn
