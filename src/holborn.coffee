constructor = (inputArray) ->
  if @typeIsArray(inputArray) is false
    throw new Error 'initialising array not passed in'

# http://coffeescriptcookbook.com/chapters/arrays/check-type-is-array
typeIsArray = Array.isArray || ( value ) -> return {}.toString.call( value ) is '[object Array]'

class Holborn
  constructor: constructor
  typeIsArray: typeIsArray

module.exports = Holborn
