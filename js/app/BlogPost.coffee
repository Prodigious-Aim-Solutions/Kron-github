define () ->

    class BlogPost
        constructor: (@id='', @title='', @body='', @tags='', @author='', @date='', @marked={}) ->
            return @
        template: '<article>' +
                  '<h3 class=\'title\'>{title}</h3>' +
                  '<p class=\'body\'>{body}</p>' + 
                  '<div class=\'author\'>{author}</div>' +
                  '<div class=\'tags\'>{tags}</div>' + 
                  '<div class=\'date\'>{date}</div>'
        display: (post) =>
            output = tempate.replace '{title}', post.title
            output += tempate.replace '{body}', @marked(post.body)
            output += tempate.replace '{author}', post.author
            output += tempate.replace '{tags}', post.tags
            output += tempate.replace '{date}', post.date
            return output

    return BlogPost