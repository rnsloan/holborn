(function() {
  var Holborn, add, all, constructor, find, length, remove, update,
    __slice = [].slice;

  constructor = function(inputArray) {
    var hasValueId, typeIsArray, typeIsString;
    typeIsArray = Array.isArray || function(value) {
      return {}.toString.call(value) === '[object Array]';
    };
    typeIsString = function(value) {
      return typeof value === 'string';
    };
    hasValueId = function(value) {
      return value.toLowerCase() === 'id';
    };
    this._checkKeys = function(obj) {
      var key, keys, _i, _len, _results;
      keys = Object.keys(obj);
      _results = [];
      for (_i = 0, _len = keys.length; _i < _len; _i++) {
        key = keys[_i];
        if (this._attributes.indexOf(key) === -1) {
          throw new Error("record key: " + key + " not in initialising array");
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };
    this._checkIfRecordMatches = function(record, compare) {
      var key, recordIsAMatch;
      recordIsAMatch = true;
      for (key in compare) {
        if (record[key] !== compare[key]) {
          recordIsAMatch = false;
        }
      }
      if (recordIsAMatch === true) {
        return true;
      }
    };
    this.unique_id = 1;
    if (typeIsArray(inputArray) === false) {
      throw new Error('initialising array not passed in');
    }
    if (inputArray.length === 0) {
      throw new Error('initialising array is empty');
    }
    if (inputArray.every(typeIsString) === false) {
      throw new Error('non string value in initialising array');
    }
    if (inputArray.every(hasValueId) === true) {
      throw new Error("value 'id' is a reserved name");
    }
    this._attributes = inputArray;
    this._records = [];
  };

  add = function() {
    var record, recordArray, records, _i, _len, _results;
    recordArray = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    records = recordArray;
    _results = [];
    for (_i = 0, _len = records.length; _i < _len; _i++) {
      record = records[_i];
      this._checkKeys(record);
      record.id = this.unique_id;
      this.unique_id++;
      _results.push(this._records.push(record));
    }
    return _results;
  };

  all = function() {
    return this._records;
  };

  find = function() {
    var checkAgainst, input, key, record, result, value, _i, _j, _len, _len1, _ref, _ref1;
    input = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    result = [];
    if (typeof input[0] === 'string') {
      key = input[0];
      value = input[1];
      _ref = this._records;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        record = _ref[_i];
        if (record[key] === value) {
          result.push(record);
        }
      }
    } else {
      checkAgainst = input[0];
      _ref1 = this._records;
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        record = _ref1[_j];
        if (this._checkIfRecordMatches(record, checkAgainst) === true) {
          result.push(record);
        }
      }
    }
    return result;
  };

  length = function() {
    return this._records.length;
  };

  remove = function() {
    var checkAgainst, idsToRemove, input, keepThisRecord, key, record, value, _i, _j, _len, _len1, _ref, _ref1;
    input = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    idsToRemove = [];
    keepThisRecord = function(record) {
      if (idsToRemove.indexOf(record.id) === -1) {
        return record;
      }
    };
    if (typeof input[0] === 'string') {
      key = input[0];
      value = input[1];
      _ref = this._records;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        record = _ref[_i];
        if (record[key] === value) {
          idsToRemove.push(record.id);
        }
      }
    } else {
      checkAgainst = input[0];
      _ref1 = this._records;
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        record = _ref1[_j];
        if (this._checkIfRecordMatches(record, checkAgainst) === true) {
          idsToRemove.push(record.id);
        }
      }
    }
    return this._records = this._records.filter(keepThisRecord);
  };

  update = function(checkAgainst, updateTo) {
    var key, record, _i, _len, _ref, _results;
    this._checkKeys(checkAgainst);
    this._checkKeys(updateTo);
    _ref = this._records;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      record = _ref[_i];
      if (this._checkIfRecordMatches(record, checkAgainst) === true) {
        _results.push((function() {
          var _results1;
          _results1 = [];
          for (key in updateTo) {
            _results1.push(record[key] = updateTo[key]);
          }
          return _results1;
        })());
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  Holborn = (function() {
    var _class;

    function Holborn() {
      return _class.apply(this, arguments);
    }

    _class = constructor;

    Holborn.prototype.add = add;

    Holborn.prototype.all = all;

    Holborn.prototype.find = find;

    Holborn.prototype.length = length;

    Holborn.prototype.remove = remove;

    Holborn.prototype.update = update;

    return Holborn;

  })();

  module.exports = Holborn;

}).call(this);
