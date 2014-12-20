Holborn = require('../src/holborn')

describe '#length', ->
  test = null
  beforeEach ->
    test = new Holborn ['name', 'age', 'sex']
  it 'should exist', ->
    test.length.should.be.a.Function

  it 'should initially return 0', ->
    test.length().should.eql 0

  it 'should return 2 when 2 records are added', ->
    test.add
      name: 'frank',
      age: 27,
      sex: 'male'
    ,
      name: 'mary',
      age: 23,
      sex: 'female'

    test.length().should.eql 2
