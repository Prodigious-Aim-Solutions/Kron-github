define () ->

    class BlogPost
        constructor: (@id='', @title='', @body='', @tags='', @author='', @date='', @marked={}) ->
            return @
        template: '<article>' +
                  '<h3 class=\'title\'><a href=\'/post/{id}\'>{title}</a></h3>' +
                  '{body}' + 
                  '<div class=\'author\'>{author}</div>' +
                  '<div class=\'tags\'>{tags}</div>' + 
                  '<div class=\'date\'>{date}</div>' + 
                  '</article>'
        display: () =>
            output = @template.replace '{title}', @title
            output = output.replace '{body}', @marked(@body)
            output = output.replace '{author}', @author
            output = output.replace '{tags}', @tags
            output = output.replace '{date}', @date
            return output

    return BlogPost