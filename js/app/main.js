// Generated by CoffeeScript 1.7.1
(function() {
  define(['editor', 'signin', '../../bower_components/marked/lib/marked', 'DataSource', 'GithubSource'], function(Editor, SignIn, marked, DataSource, GithubSource) {
    var App, app, ds;
    App = (function() {
      function App(dataSource) {
        var editor, signin;
        this.dataSource = dataSource != null ? dataSource : {};
        marked.setOptions({
          renderer: new marked.Renderer(),
          gfm: true,
          tables: true,
          breaks: false,
          pedantic: false,
          sanitize: true,
          smartLists: true,
          smartypants: false
        });
        signin = new SignIn(this.dataSource);
        editor = new Editor(marked, this.dataSource);
        return this;
      }

      return App;

    })();
    ds = new DataSource(new GithubSource());
    app = new App(ds);
    return app;
  });

}).call(this);
