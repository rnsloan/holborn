Holborn = require('../src/holborn')

describe '#add', ->
  test = null
  beforeEach ->
    test = new Holborn ['name', 'age', 'sex']

  it 'should exist', ->
    test.add.should.be.a.Function

  it 'should add a single record to its store', ->
    test._records.should.be.empty
    test.add
      name: 'john',
      age: 15,
      sex: 'male'

    test._records.should.eql([
      id: 1,
      name: 'john',
      age: 15,
      sex: 'male'
    ])

    test.unique_id.should.eql 2

  it 'should not matter what order the passed in records keys are in', ->
    test._records.should.be.empty
    test.add
      sex: 'male'
      age: 15,
      name: 'john'

    test._records.should.eql([
      id: 1,
      name: 'john',
      age: 15,
      sex: 'male'
    ])

  it 'should add multiple records to its store', ->
    test.add
      name: 'frank',
      age: 27,
      sex: 'male'
    ,
      name: 'mary',
      age: 23,
      sex: 'female'

    test._records.should.eql([
      id: 1,
      name: 'frank',
      age: 27,
      sex: 'male'
    ,
      id: 2,
      name: 'mary',
      age: 23,
      sex: 'female'
    ])

    test.unique_id.should.eql 3

  it 'should throw an error if trying to add a key that has not been initialised', ->
    test2 = ->
      test.add
        name: 'john',
        age: 15,
        foobar: 1234

    test2.should.throw("record key: foobar not in initialising array")
