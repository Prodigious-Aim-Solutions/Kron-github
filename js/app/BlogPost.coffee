define ['../../bower_components/marked/lib/marked'], (marked) ->

    class BlogPost
        constructor: (@id='', @title='', @body='', @tags='', @author='', @date='') ->
            marked.setOptions 
              renderer: new marked.Renderer(),
              gfm: true,
              tables: true,
              breaks: false,
              pedantic: false,
              sanitize: true,
              smartLists: true,
              smartypants: false
            return @
        template: '<article id=\'post{id}\'>' +
                  '<h3 class=\'title\'><a href=\'#/display/{id}\'>{title}</a></h3>' +
                  '{body}' + 
                  '<div class=\'author\'>{author}</div>' +
                  '<div class=\'tags\'>{tags}</div>' + 
                  '<div class=\'date\'>{date}</div>' + 
                  '</article>'
        display: () =>
            output = @template.replace /{id}/g, @id
            output = output.replace '{title}', @title
            output = output.replace '{body}', @marked(@body)
            output = output.replace '{author}', @author
            output = output.replace '{tags}', @tags
            output = output.replace '{date}', @date
            return output

    return BlogPost