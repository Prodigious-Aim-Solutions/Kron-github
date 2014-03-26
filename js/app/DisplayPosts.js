// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define(['BlogPost'], function(BlogPost) {
    var DisplayPosts;
    DisplayPosts = (function() {
      function DisplayPosts(ds, marked) {
        this.ds = ds != null ? ds : {};
        this.marked = marked != null ? marked : {};
        this.display = __bind(this.display, this);
        this.displayAll = __bind(this.displayAll, this);
        this.displayAll();
        return this;
      }

      DisplayPosts.prototype.displayAll = function() {
        var output, post, posts, _i, _len;
        output = "";
        posts = this.ds.get();
        for (_i = 0, _len = posts.length; _i < _len; _i++) {
          post = posts[_i];
          output += this.display(post);
        }
        $('.posts').append(output);
        return this;
      };

      DisplayPosts.prototype.display = function(post) {
        return new BlogPost(post.id, post.title, post.body, post.tags, post.author, post.date, this.marked).display();
      };

      return DisplayPosts;

    })();
    return DisplayPosts;
  });

}).call(this);
