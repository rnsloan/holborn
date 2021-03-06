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
      test._records.should.eql([])

    it 'should throw an error if a value has the name "id"', ->
      test = ->
        new Holborn(['id'])
      test.should.throw("value 'id' is a reserved name")

      test2 = ->
        new Holborn(['ID'])
      test2.should.throw("value 'id' is a reserved name")
