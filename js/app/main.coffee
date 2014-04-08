requirejs.config
    paths:
        octokit: '../../bower_components/octokit/octokit'
        underscore: '../../bower_components/underscore/underscore'
        jquery: '../../bower_components/jquery/dist/jquery'

define ['app', 'DataSource', 'GithubSource'], (App, DataSource, GithubSource) ->
    
    ds = new DataSource(new GithubSource())
    app = new App(ds)
    return app