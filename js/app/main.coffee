define ['editor', 'signin', '../../bower_components/marked/lib/marked', 'DataSource', 'GithubSource'], (Editor, SignIn, marked, DataSource, GithubSource) ->
    class App
        constructor: (@dataSource = {}) ->
            marked.setOptions 
              renderer: new marked.Renderer(),
              gfm: true,
              tables: true,
              breaks: false,
              pedantic: false,
              sanitize: true,
              smartLists: true,
              smartypants: false
            signin = new SignIn(@dataSource)
            editor = new Editor(marked, @dataSource)
            return @
    ds = new DataSource(new GithubSource())
    app = new App(ds)
    return app