// Generated by CoffeeScript 1.7.1
(function() {
  requirejs.config({
    paths: {
      octokit: '../../bower_components/octokit/octokit',
      underscore: '../../bower_components/underscore/underscore',
      jquery: '../../bower_components/jquery/dist/jquery'
    }
  });

  define(['app', 'DataSource', 'GithubSource'], function(App, DataSource, GithubSource) {
    var app, ds;
    ds = new DataSource(new GithubSource());
    app = new App(ds);
    return app;
  });

}).call(this);
