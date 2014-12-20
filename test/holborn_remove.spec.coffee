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

  it 'should remove records when key, value are strings', ->
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

    test.remove('age', 23)

    test.all().should.eql([
      id: 3,
      name: 'harry',
      age: 30,
      sex: 'male'
    ])

  it 'should remove records when key, value are an object', ->
    test.remove({age: 23, name: 'frank'})

    test.all().should.eql([
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
