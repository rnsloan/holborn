hello = -> 'hello holborn222'

# items attached to our namespace are available in Node.js as well as client browsers
class Holborn
  hello: hello

module.exports = Holborn

