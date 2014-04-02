// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define(['../../bower_components/marked/lib/marked'], function(marked) {
    var BlogPost;
    BlogPost = (function() {
      function BlogPost(id, title, body, tags, author, date) {
        this.id = id != null ? id : '';
        this.title = title != null ? title : '';
        this.body = body != null ? body : '';
        this.tags = tags != null ? tags : '';
        this.author = author != null ? author : '';
        this.date = date != null ? date : '';
        this.display = __bind(this.display, this);
        return this;
      }

      BlogPost.prototype.template = '<article id=\'post{id}\'>' + '<h3 class=\'title\'><a href=\'#/display/{id}\'>{title}</a></h3>' + '{body}' + '<div class=\'author\'>{author}</div>' + '<div class=\'tags\'>{tags}</div>' + '<div class=\'date\'>{date}</div>' + '</article>';

      BlogPost.prototype.display = function() {
        var output;
        output = this.template.replace(/{id}/g, this.id);
        output = output.replace('{title}', this.title);
        output = output.replace('{body}', this.marked(this.body));
        output = output.replace('{author}', this.author);
        output = output.replace('{tags}', this.tags);
        output = output.replace('{date}', this.date);
        return output;
      };

      return BlogPost;

    })();
    return BlogPost;
  });

}).call(this);
