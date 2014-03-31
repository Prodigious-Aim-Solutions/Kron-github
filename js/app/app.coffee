define ['editor', 'signin', 'DisplayPosts', '../../bower_components/marked/lib/marked', 'Routes'], (Editor, SignIn, DisplayPosts, marked, Routes) ->
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
            editor = new Editor(@dataSource, marked)
            displayPage = new DisplayPosts(@dataSource, marked)
            routes = new Routes(@dataSource, displayPage)
            return @
        
    return App