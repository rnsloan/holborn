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
  objects = input

  checkKeys = (obj) =>
    keys = Object.keys(obj)
    for key in keys
      if @_attributes.indexOf(key) == -1
        throw new Error "object key: #{key} not in initialising array"

  for obj in objects
    checkKeys(obj)
    obj.id = @unique_id
    @unique_id++
    @_store.push obj


class Holborn
  constructor: constructor
  add: add

module.exports = Holborn
