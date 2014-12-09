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

  describe '#add', ->
    it 'should exist', ->
      test = new Holborn ['name']
      test.add.should.be.a.Function

    it 'should add a single object to its store', ->
      test = new Holborn ['name', 'age', 'sex']
      test._store.should.be.empty
      test.add
        name: 'john',
        age: 15,
        sex: 'male'

      test._store.should.eql([
        name: 'john',
        age: 15,
        sex: 'male'
      ])


  # http://coffeescriptcookbook.com/chapters/classes_and_objects/chaining

  # add
  #should store single object
  #should generate id of 1
  #should store multiple object
  #should generate id of 2
  #should error if object passed in has key that is not in attributes object
  #should allow key order of passed in object to be random
  #should allow chaining add methods
