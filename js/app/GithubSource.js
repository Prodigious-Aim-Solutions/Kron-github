// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define(['octokit', 'BlogPost'], function(Octokit, BlogPost) {
    var GithubSource;
    GithubSource = (function() {
      function GithubSource() {
        this._getIndex = __bind(this._getIndex, this);
        this._getPost = __bind(this._getPost, this);
        this._getItems = __bind(this._getItems, this);
        this.getAll = __bind(this.getAll, this);
        this.get = __bind(this.get, this);
        this.remove = __bind(this.remove, this);
        this.update = __bind(this.update, this);
        this.create = __bind(this.create, this);
        this.source = null;
        return this;
      }

      GithubSource.prototype.login = function(user, pass, cb) {
        var repo;
        this.github = new Octokit({
          username: user,
          password: pass
        });
        repo = this.github.getRepo('Corbzilla', 'Corbzilla.github.io');
        this.source = repo.getBranch();
        if ((cb != null) && typeof cb === 'function') {
          cb(null, {
            success: true
          });
        }
      };

      GithubSource.prototype.create = function(item, cb) {
        var filename;
        if ((item != null) && (item.title != null) && (item.body != null)) {
          filename = 'posts/Corbzilla//' + item.title.split(' ').join('-') + ".md";
          this._getIndex().then((function(_this) {
            return function(index) {
              var indexDom;
              indexDom = $(index.content);
              indexDom.find('.posts').append(item);
              _this.source.write('index.html', indexDom.html(), '', false);
              _this.source.write(filename, item.body, "Added post " + filename, false);
              if ((cb != null) && typeof cb === 'function') {
                cb(null, {
                  success: true
                });
              }
            };
          })(this), function(err) {
            cb(err, {
              success: false
            });
          });
        }
        cb('Create/Update Error: Incomplete Item', {
          success: false
        });
        return this;
      };

      GithubSource.prototype.update = function(item, cb) {
        this.create(item, cb);
        return this;
      };

      GithubSource.prototype.remove = function(item, cb) {
        var filename;
        if (item && item.title) {
          filename = 'posts/Corbzilla/data/' + item.title.split(' ').join('-') + ".md";
          this.source.remove(filename, item.body, "Removed post " + filename, false).then((function(_this) {
            return function() {
              if ((cb != null) && typeof cb === 'function') {
                cb(null, {
                  success: true
                });
              }
            };
          })(this), (function(_this) {
            return function(err) {
              cb(err, {
                success: false
              });
            };
          })(this));
        }
        return this;
      };

      GithubSource.prototype.get = function(item, cb) {
        var filename;
        filename = 'posts/Corbzilla/data/' + item.title.split(' ').join('-') + ".md";
        this._getPost.then((function(_this) {
          return function(post) {
            if ((cb != null) && typeof cb === 'function') {
              cb(null, new BlogPost(post).display());
            }
          };
        })(this), (function(_this) {
          return function(err) {
            cb(err, {
              success: false
            });
          };
        })(this));
        return [];
      };

      GithubSource.prototype.getAll = function(cb) {
        var id;
        id = 0;
        this.blogPosts = [];
        if (this.source != null) {
          return this._getItems().then((function(_this) {
            return function(posts) {
              var i, post, _i, _len, _results;
              _results = [];
              for (i = _i = 0, _len = posts.length; _i < _len; i = ++_i) {
                post = posts[i];
                _results.push((function(post) {
                  return _this._getPost(post).then(function(p) {
                    var newPost, title;
                    title = post.name.split('.')[0].split('-').join(' ');
                    newPost = {};
                    newPost.id = id;
                    newPost.title = title;
                    newPost.body = p.content;
                    newPost.author = 'Corbzilla';
                    newPost.date = 'March';
                    newPost.tags = 'new';
                    id++;
                    if ((cb != null) && typeof cb === 'function') {
                      return cb(null, newPost);
                    }
                  });
                })(post));
              }
              return _results;
            };
          })(this), (function(_this) {
            return function(err) {
              cb(err, {
                success: false
              });
            };
          })(this));
        } else {
          return [];
        }
      };

      GithubSource.prototype._getItems = function() {
        if (this.source != null) {
          return this.source.contents('posts/Corbzilla/data', false);
        }
      };

      GithubSource.prototype._getPost = function(post) {
        if (this.source != null) {
          return this.source.read("posts/Corbzilla/data/" + post.name);
        }
      };

      GithubSource.prototype._getIndex = function() {
        if (this.source != null) {
          return this.source.read('index.html');
        }
      };

      return GithubSource;

    })();
    return GithubSource;
  });

}).call(this);
