Holborn = require('../src/holborn')

describe 'Holborn', ->
  it 'should exist', ->
    Holborn.should.be.ok

  describe '#constructor', ->
    it 'should create instances', ->
      test = new Holborn(['foo', 'bar'])
      test.should.be.an.instanceof(Holborn)

    it 'should throw an error if not initialised with array', ->
      test = ->
        new Holborn()
      test.should.throw('initialising array not passed in')

      test2 = ->
        new Holborn('foobar')
      test2.should.throw('initialising array not passed in')

    it 'should throw an error if initialise array is empty', ->
      test = ->
        new Holborn([])
      test.should.throw('initialising array is empty')

    it 'should throw an error if all array values are not a string', ->
      test = ->
        new Holborn(['erer', 5])
      test.should.throw('non string value in initialising array')

      test2 = ->
        new Holborn(['erer', 'sdsd'])
      test2.should.not.throw()

    it 'should save the initialising array values as an attributes property on the instance', ->
      test = new Holborn(['foo', 'bar'])

      (typeof Holborn._attributes).should.be.undefined

      test.should.have.property('_attributes')
      test._attributes.should.eql(['foo', 'bar'])

    it 'should initialise an empty store', ->
      test = new Holborn(['foo', 'bar'])
      test._store.should.eql([])

    it 'should throw an error if value is id', ->
      test = ->
        new Holborn(['id'])
      test.should.throw("value 'id' is a reserved name")

      test2 = ->
        new Holborn(['ID'])
      test2.should.throw("value 'id' is a reserved name")

  describe '#add', ->
    test = null
    beforeEach ->
      test = new Holborn ['name', 'age', 'sex']

    it 'should exist', ->
      test.add.should.be.a.Function

    it 'should add a single object to its store', ->
      test._store.should.be.empty
      test.add
        name: 'john',
        age: 15,
        sex: 'male'

      test._store.should.eql([
        id: 1,
        name: 'john',
        age: 15,
        sex: 'male'
      ])

      test.unique_id.should.eql 2

    it 'should not matter what order the passed in objects keys are in', ->
      test._store.should.be.empty
      test.add
        sex: 'male'
        age: 15,
        name: 'john'

      test._store.should.eql([
        id: 1,
        name: 'john',
        age: 15,
        sex: 'male'
      ])

    it 'should add multiple objects to its store', ->
      test.add
        name: 'frank',
        age: 27,
        sex: 'male'
      ,
        name: 'mary',
        age: 23,
        sex: 'female'

      test._store.should.eql([
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

    it 'should be chainable', ->
      test.add
        name: 'frank',
        age: 27,
        sex: 'male'
      .add
        name: 'mary',
        age: 23,
        sex: 'female'

      test._store.should.eql([
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

    it 'should throw an error if trying to add key that has not been initialised', ->
      test2 = ->
        test.add
          name: 'john',
          age: 15,
          foobar: 1234

      test2.should.throw("object key: foobar not in initialising array")

  describe '#length', ->
    test = null
    beforeEach ->
      test = new Holborn ['name', 'age', 'sex']
    it 'should exist', ->
      test.length.should.be.a.Function

    it 'should initially return 0', ->
      test.length().should.eql 0

    it 'should return 2 when 2 objects are added', ->
      test.add
        name: 'frank',
        age: 27,
        sex: 'male'
      .add
        name: 'mary',
        age: 23,
        sex: 'female'

      test.length().should.eql 2
