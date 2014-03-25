// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define(function() {
    var GithubSource;
    GithubSource = (function() {
      function GithubSource() {
        this.getAll = __bind(this.getAll, this);
        this.get = __bind(this.get, this);
        this.remove = __bind(this.remove, this);
        this.update = __bind(this.update, this);
        this.create = __bind(this.create, this);
        return this;
      }

      GithubSource.prototype.login = function(user, pass) {
        this.github = new Github({
          username: user,
          password: pass,
          auth: 'basic'
        });
      };

      GithubSource.prototype.create = function(item) {
        return this;
      };

      GithubSource.prototype.update = function(item) {
        return this;
      };

      GithubSource.prototype.remove = function(item) {
        return this;
      };

      GithubSource.prototype.get = function(item) {
        return this;
      };

      GithubSource.prototype.getAll = function() {
        return this;
      };

      return GithubSource;

    })();
    return GithubSource;
  });

}).call(this);