# holborn [![Build Status](https://secure.travis-ci.org/rnsloan/holborn.png?branch=master)](https://travis-ci.org/rnsloan/holborn)

A datastore kind of like a cross between Backbone's Model and Collection


## Getting started

`npm install holborn`

## API

### Initialising

Create a new store by initialising with the keys

`var store = new Holborn['name', 'age', 'sex']`

### add

`store.add({name: 'john', age: 15, sex: 'male'})`

`store.add({name: 'frank', age: 27, sex: 'male'},{name: 'mary', age: 23, sex: 'female'})`

### all

```
store.all() >>
[{id: 1, name: 'frank', age: 27, sex: 'male'},{id: 2, name: 'mary', age: 23, sex: 'female'}]
```

### find

```
store.find('name', 'frank') >>
[{id: 1, name: 'frank', age: 23, sex: 'male'}]
```

```
store.find({age: 23, name: 'frank'}) >>
[{id: 1, name: 'frank', age: 23, sex: 'male'}]
```

### length

```
store.length() >>
2
```

### remove

`test.remove('age', 23)`

`test.remove({age: 23, name: 'frank'})`


### update

`test.update({name: 'frank', age: 23}, {name: 'roger'})`

`test.update({age: 23, name: 'keith'}, {name: 'roger', age: 45})`


## Development


Running spec tests and linting
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

Linting coffeescript (by rules defined in coffeelint.json)
```bash
  $ grunt lint
```

Watching files for changes. Will trigger `test` job on file changes  
```bash
  $ grunt watch
```

## License

MIT
