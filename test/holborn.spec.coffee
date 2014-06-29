mod = require "#{process.cwd()}/src/holborn"

describe 'holborn', ->
  it 'should exist', ->
    mod.should.be.ok

  describe '#hello', ->
    it 'should return the right value', ->
      mod.hello().should.eql 'hello holborn'


