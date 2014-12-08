Holborn = require('../src/holborn')

describe 'Holborn', ->
  it 'should exist', ->
    Holborn.should.be.ok

  describe '#constructor', ->
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




  # initialise
  # http://coffeescriptcookbook.com/chapters/classes_and_objects/chaining
  #should initialise as a new class
  #should error if array is not passed in
  #should save passed in array as attributes object

  # add
  #should store single object
  #should generate id of 1
  #should store multiple object
  #should generate id of 2
  #should error if object passed in has key that is not in attributes object
  #should allow key order of passed in object to be random
  #should allow chaining add methods
