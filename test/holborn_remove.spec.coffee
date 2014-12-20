Holborn = require('../src/holborn')

describe '#remove', ->
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
    ,
      name: 'harry',
      age: 30,
      sex: 'male'

  it 'should exist', ->
    test.remove.should.be.a.Function

  it 'should remove items returned from a search result', ->
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
    ,
      id: 3,
      name: 'harry',
      age: 30,
      sex: 'male'
    ])

    removal = test.find('age', 23)

    test.remove(removal)

    test.all().should.eql([
      id: 3,
      name: 'harry',
      age: 30,
      sex: 'male'
    ])
