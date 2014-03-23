// Generated by CoffeeScript 1.7.1
(function() {
  describe('App', function() {
    describe('Global App', function() {
      it('should exist in the window namespace', function() {
        Should.exists(window.App);
      });
      it('should have an editor namespace', function() {
        Should.exists(window.App.Editor);
      });
    });
    describe('Editor', function() {
      it('should exists', function() {
        var editor;
        editor = new window.App.Editor();
        Should.exist(editor);
      });
      it('should have a markdown editor', function() {
        var editor;
        editor = new window.App.Editor();
        Should.exist(editor.markdownEditor);
      });
    });
    describe('BlogPost', function() {
      var post;
      post = new window.App.BlogPost();
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

}).call(this);
