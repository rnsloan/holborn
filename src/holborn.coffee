constructor = (inputArray) ->
  # http://coffeescriptcookbook.com/chapters/arrays/check-type-is-array
  typeIsArray = Array.isArray || ( value ) -> return {}.toString.call( value ) is '[object Array]'
  typeIsString = ( value ) -> return typeof value == 'string'
  hasValueId = ( value ) -> return value.toLowerCase() == 'id'

  @_checkKeys = (obj) ->
    keys = Object.keys(obj)
    for key in keys
      if @_attributes.indexOf(key) == -1
        throw new Error "record key: #{key} not in initialising array"

  @_checkIfRecordMatches = (record, compare) ->
    recordIsAMatch = true
    for key of compare
      if record[key] != compare[key]
        recordIsAMatch = false

    if recordIsAMatch is true
      return true

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
  @_records = []

  return


add = (recordArray...) ->
  records = recordArray

  for record in records
    @_checkKeys(record)
    record.id = @unique_id
    @unique_id++
    @_records.push record


all = ->
  @_records


find = (input...) ->
  result = []

  if typeof input[0] == 'string'
    key = input[0]
    value = input[1]

    for record in @_records
      if record[key] == value
        result.push record
  else
    checkAgainst = input[0]
    for record in @_records
      if @_checkIfRecordMatches(record, checkAgainst) is true
        result.push record

  result


length = ->
  @_records.length


remove = (input...) ->
  idsToRemove = []
  keepThisRecord = (record) ->
    if idsToRemove.indexOf(record.id) == -1
      return record

  if typeof input[0] == 'string'
    key = input[0]
    value = input[1]

    for record in @_records
      if record[key] == value

        idsToRemove.push record.id
  else
    checkAgainst = input[0]
    for record in @_records
      if @_checkIfRecordMatches(record, checkAgainst) is true
        idsToRemove.push record.id

  @_records = @_records.filter(keepThisRecord)


update = (checkAgainst, updateTo) ->
  @_checkKeys(checkAgainst)
  @_checkKeys(updateTo)

  for record in @_records
    if @_checkIfRecordMatches(record, checkAgainst) is true
      for key of updateTo
        record[key] = updateTo[key]


class Holborn
  constructor: constructor
  add: add
  all: all
  find: find
  length: length
  remove: remove
  update: update


module.exports = Holborn
