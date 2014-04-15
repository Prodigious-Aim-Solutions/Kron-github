define ['BlogPost'], (BlogPost) ->
    class DisplayPosts
        constructor: (@ds = {}, ) ->
            @displayAll()
            return @
        displayAll: () =>
            output = ""
            @ds.get(null, @display)
            return @
        display: (err, post) =>
            blogPost = new BlogPost(post.id, post.title, post.body, post.tags, post.author, post.date, @marked).display()
            $('.posts').append(blogPost)
        
    return DisplayPosts