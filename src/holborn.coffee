constructor = (inputArray) ->
  # http://coffeescriptcookbook.com/chapters/arrays/check-type-is-array
  typeIsArray = Array.isArray || ( value ) -> return {}.toString.call( value ) is '[object Array]'
  typeIsString = ( value ) -> return typeof value == 'string'
  hasValueId = ( value ) -> return value.toLowerCase() == 'id'
  @unique_id = 1

  if typeIsArray(inputArray) is false
    throw new Error 'initialising array not passed in'

  if inputArray.length is 0
    throw new Error 'initialising array is empty'

  if inputArray.every(typeIsString) is false
    throw new Error 'non string value in initialising array'

  if inputArray.every(hasValueId) is true
    throw new Error "value 'id' is a reserved name"

  @_attributes = inputArray
  @_store = []

  return

add = (input...) ->
  entries = input
  entries.every (element) =>
    element.id = @unique_id
    @unique_id++
    @_store.push element

class Holborn
  constructor: constructor
  add: add

module.exports = Holborn
