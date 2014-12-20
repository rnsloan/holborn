Holborn = require('../src/holborn')

describe '#all', ->
  test = null
  beforeEach ->
    test = new Holborn ['name', 'age', 'sex']
  it 'should exist', ->
    test.all.should.be.a.Function

  it 'should exist return all records', ->
    test.add
      name: 'frank',
      age: 27,
      sex: 'male'
    ,
      name: 'mary',
      age: 23,
      sex: 'female'

    test.all().should.eql([
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
