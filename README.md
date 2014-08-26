# holborn [![Build Status](https://secure.travis-ci.org/rnsloan/holborn.png?branch=master)](https://travis-ci.org/rnsloan/holborn)

Opinionated Model useful for prototyping 

## Getting started

`npm install holborn`


## Development

### Available grunt tasks

Running spec tests and lint your amazing code  
```bash
  $ grunt test
```

Coverage (you will need to pipe the results)  
```bash
  $ grunt cov > cov.html
```

Building coffeescript to js  
```bash
  $ grunt build
```

Bump the version
```bash
  $ grunt bump
```

Linting your coffeescript (by rules defined in coffeelint.json)  
```bash
  $ grunt lint
```

Watching files for changes. Will trigger `test` job on file changes  
```bash
  $ grunt watch
```

## License

MIT
