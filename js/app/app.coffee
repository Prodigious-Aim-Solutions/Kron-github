define ['editor', 'signin', 'DisplayPosts', '../../bower_components/marked/lib/marked', 'Routes'], (Editor, SignIn, DisplayPosts, marked, Routes) ->
    class App
        constructor: (@dataSource = {}) ->
            
            signin = new SignIn(@dataSource)
            editor = new Editor(@dataSource, marked)
            displayPage = new DisplayPosts(@dataSource, marked)
            routes = new Routes(@dataSource, displayPage)
            return @
        
    return App