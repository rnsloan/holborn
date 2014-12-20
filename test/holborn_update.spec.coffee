Holborn = require('../src/holborn')

describe '#update', ->
  test = null
  beforeEach ->
    test = new Holborn ['name', 'age', 'sex']

    test.add
      name: 'frank',
      age: 23,
      sex: 'male'
    ,
      name: 'mary',
      age: 23,
      sex: 'female'

  it 'should exist', ->
    test.update.should.be.a.Function

  it 'should update a record', ->
    test.update({name: 'frank'}, {name: 'roger'})

    test.all().should.eql([
      id: 1,
      name: 'roger',
      age: 23,
      sex: 'male'
    ,
      id: 2,
      name: 'mary',
      age: 23,
      sex: 'female'
    ])

  it 'should update a record when the search has multiple keys', ->
    test.update({name: 'frank', age: 23}, {name: 'roger'})

    test.all().should.eql([
      id: 1,
      name: 'roger',
      age: 23,
      sex: 'male'
    ,
      id: 2,
      name: 'mary',
      age: 23,
      sex: 'female'
    ])

  it 'should update a record when the update has multiple keys', ->
    test.update({name: 'frank', age: 23}, {name: 'roger', age: 45})

    test.all().should.eql([
      id: 1,
      name: 'roger',
      age: 45,
      sex: 'male'
    ,
      id: 2,
      name: 'mary',
      age: 23,
      sex: 'female'
    ])

  it 'should not matter what order the properties are passed in', ->
    test.update({age: 23, name: 'frank'}, {name: 'roger', age: 45})

    test.all().should.eql([
      id: 1,
      name: 'roger',
      age: 45,
      sex: 'male'
    ,
      id: 2,
      name: 'mary',
      age: 23,
      sex: 'female'
    ])

  it 'should not update if no matches are found', ->
    test.update({age: 23, name: 'keith'}, {name: 'roger', age: 45})

    test.all().should.eql([
      id: 1,
      name: 'frank',
      age: 23,
      sex: 'male'
    ,
      id: 2,
      name: 'mary',
      age: 23,
      sex: 'female'
    ])

  it 'should throw errors if passed in records have keys that were not initialised', ->
    check = ->
      test.update({color: 23, name: 'keith'}, {name: 'roger', age: 45})

    check.should.throw("record key: color not in initialising array")
