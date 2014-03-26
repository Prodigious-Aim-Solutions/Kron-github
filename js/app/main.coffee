define ['app', 'DataSource', 'GithubSource'], (App, DataSource, GithubSource) ->
    
    ds = new DataSource(new GithubSource())
    app = new App(ds)
    return app