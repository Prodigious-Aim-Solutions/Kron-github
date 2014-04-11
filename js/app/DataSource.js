// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define(function() {
    var DataSource;
    DataSource = (function() {
      function DataSource(_source) {
        this._source = _source != null ? _source : {};
        this.get = __bind(this.get, this);
        this.remove = __bind(this.remove, this);
        this.update = __bind(this.update, this);
        this.create = __bind(this.create, this);
        this.login = __bind(this.login, this);
        return this;
      }

      DataSource.prototype.login = function(user, pass, cb) {
        this._source.login(user, pass);
      };

      DataSource.prototype.create = function(item, cb) {
        return this._source.create(item);
      };

      DataSource.prototype.update = function(item, cb) {
        return this.source.update(item);
      };

      DataSource.prototype.remove = function(item, cb) {
        return this._source.remove(item);
      };

      DataSource.prototype.get = function(item, cb) {
        if (item && cb) {
          return this._source.get(item, cb);
        } else if (cb && !item) {
          return this._source.getAll(cb);
        }
      };

      return DataSource;

    })();
    return DataSource;
  });

}).call(this);
