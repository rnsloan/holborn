Holborn = require('../src/holborn')

describe '#find', ->
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
    test.find.should.be.a.Function

  it 'should return correct result', ->
    test.find('name', 'frank').should.eql([
      id: 1,
      name: 'frank',
      age: 23,
      sex: 'male'
    ])

    test.find('id', 1).should.eql([
      id: 1,
      name: 'frank',
      age: 23,
      sex: 'male'
    ])

    test.find('age', 23).should.eql([
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

    test.find('age', 34).should.eql([])
    test.find('namesss', 'mary').should.eql([])
