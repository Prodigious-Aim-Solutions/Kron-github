define ['BlogPost'], (BlogPost) ->
    class DisplayPosts
        constructor: (@ds = {}, @marked = {}) ->
            @displayAll()
            return @
        displayAll: () =>
            output = ""
            posts = @ds.get()
            output += @display(post) for post in posts
            $('.posts').append(output)
            return @
        display: (post) =>
            return new BlogPost(post.id, post.title, post.body, post.tags, post.author, post.date, @marked).display()
        
    return DisplayPosts