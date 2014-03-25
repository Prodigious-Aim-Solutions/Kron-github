// Generated by CoffeeScript 1.7.1
(function() {
  require(['../js/app/main', '../js/app/editor', '../js/app/BlogPost'], function(app, Editor, BlogPost) {
    return describe('App', function() {
      describe('Global App', function() {
        it('app should exist', function() {
          Should.exists(app);
        });
      });
      describe('Editor', function() {
        var editor;
        editor = new Editor();
        it('should exists', function() {
          Should.exist(editor);
        });
        it('should have a markdown editor', function() {
          Should.exist(editor.markdownEditor);
        });
      });
      describe('BlogPost', function() {
        var post;
        post = new BlogPost();
        it('should have a title', function() {
          Should.exists(post.title);
        });
        it('should have a body', function() {
          Should.exists(post.body);
        });
        it('should have a tags', function() {
          Should.exists(post.tags);
        });
        it('should have an author', function() {
          Should.exists(post.author);
        });
        return it('should have a date', function() {
          Should.exists(post.date);
        });
      });
    });
  });

}).call(this);
