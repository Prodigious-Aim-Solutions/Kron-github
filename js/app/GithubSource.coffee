define ['octokit', 'BlogPost'],  (Octokit, BlogPost) ->
    class GithubSource
        constructor: () ->
            @source = null
            return @
        login: (user, pass) ->
            @github = new Octokit
                username: user,
                password: pass
            repo = @github.getRepo('Corbzilla', 'Corbzilla.github.io')
            @source = repo.getBranch()
        create: (item, cb) =>
            if item? && item.title? && item.body?
                filename = 'posts/Corbzilla/data/' + item.title.split(' ').join('-') + ".md"
                @_getIndex().then (index) =>
                    indexDom = $(index.contents).find('.posts').append(item)
                    @source.write('index.html', indexDom.html(), '', false)
                    @source.write(filename, item.body, "Added post #{ filename }", false)
            return @
        update: (item, cb) =>
            @create(item)
            return @
        remove: (item, cb) =>
            if item && item.title
                filename = 'posts/Corbzilla/data/' + item.title.split(' ').join('-') + ".md"
                @source.remove(filename, item.body, "Removed post #{ filename }", false)
            return @
        get: (item, cb) =>
            filename = 'posts/Corbzilla/data/' + item.title.split(' ').join('-') + ".md"
            @_getPost.then (post) =>
                cb(new BlogPost(post).display())
            return []
        getAll: (cb) =>
            id = 0
            @blogPosts = []
            if @source?                
                @_getItems().then (posts) =>
                    for post, i in posts                        
                        do (post) => return @_getPost(post).then (p) =>
                            title = post.name.split('.')[0].split('-').join(' ')
                            newPost = {}
                            newPost.id = id
                            newPost.title = title
                            newPost.body = p.content
                            newPost.author = 'Corbzilla'
                            newPost.date = 'March'
                            newPost.tags = 'new'
                            id++
                            cb(newPost)
                
            else
                return []
        _getItems: () =>
            return @source.contents('posts/Corbzilla/data', false)
        _getPost: (post) =>
            return @source.read("posts/Corbzilla/data/#{ post.name }")
        _getIndex: () =>
            return @source.read('index.html')
        
    return GithubSource