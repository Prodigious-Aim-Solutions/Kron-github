require ['editor', '../../bower_components/marked/lib/marked'], (Editor, marked) ->
    class App
        constructor: () ->
            marked.setOptions 
              renderer: new marked.Renderer(),
              gfm: true,
              tables: true,
              breaks: false,
              pedantic: false,
              sanitize: true,
              smartLists: true,
              smartypants: false
            editor = new Editor(marked)
            return @
    app = new App()
    return