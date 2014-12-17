###
Model
-------
create a model that stores records,
record names and attributes created on setup call. passed in as array
.create, .read, .update, .delete
set defaults
.all returns all records
.find returns object with all records that match find 'name' , 'ross'
 can bind events
- method chaining
- remote datastore in separate github
- guid (this.id)


later
- add custom methods e.g. validate for on object creation

###

#store as attributes object to validate against in future
store = new Holborn ['name', 'age', 'sex']

store.add
  name: 'john',
  age: 15,
  sex: 'male'

#can insert in any order
store.add
  age: '20',
  sex: 'female',
  name: 'sarah'

#can add multiple records at once
store.add
  name: 'paul',
  age: 30,
  sex: 'male'
,
  name: 'steve',
  age: 31,
  sex: 'male'


# should return correct number
store.length()

# should return all records
store.all()

# save to localstorage
store.save()

# retrieve / update from local storage
store.fetch()

# return all relevant rows
store.find
  name: 'john'
