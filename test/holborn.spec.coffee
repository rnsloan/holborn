mod = require "#{process.cwd()}/src/holborn"

describe 'holborn', ->
  it 'should exist', ->
    mod.should.be.ok

  describe '#hello', ->
    it 'should return the right value', ->
      mod.hello().should.eql 'hello holborn'

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
