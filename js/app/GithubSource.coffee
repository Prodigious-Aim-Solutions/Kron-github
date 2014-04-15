define ['octokit', 'BlogPost'],  (Octokit, BlogPost) ->
    class GithubSource
        constructor: () ->
            @source = null
            return @
        login: (user, pass, cb) ->
            @github = new Octokit
                username: user,
                password: pass
            repo = @github.getRepo('Corbzilla', 'Corbzilla.github.io')
            @source = repo.getBranch()
            if cb? && typeof cb == 'function'
                cb(null, success: true)
            return
        create: (item, cb) =>
            if item? && item.title? && item.body?
                filename = 'posts/Corbzilla/data/' + item.title.split(' ').join('-') + ".md"
                @_getIndex().then (index) =>
                    indexDom = $(index.content)
                    indexDom.find('.posts').append(item)
                    @source.write('index.html', indexDom.html(), '', false)
                    @source.write(filename, item.body, "Added post #{ filename }", false)
                    if cb? && typeof cb == 'function'
                        cb(null, success: true)
                    return
                , (err) ->
                    cb(err, success: false)
                    return
            cb('Create/Update Error: Incomplete Item', success: false)
            return @
        update: (item, cb) =>
            @create(item, cb)
            return @
        remove: (item, cb) =>
            if item && item.title
                filename = 'posts/Corbzilla/data/' + item.title.split(' ').join('-') + ".md"
                @source.remove(filename, item.body, "Removed post #{ filename }", false).then () =>
                    if cb? && typeof cb == 'function'
                        cb(null, success: true)
                        return
                , (err) =>
                    cb(err, success: false)
                    return
            return @
        get: (item, cb) =>
            filename = 'posts/Corbzilla/data/' + item.title.split(' ').join('-') + ".md"
            @_getPost.then (post) =>
                if cb? && typeof cb == 'function'
                    cb(null, new BlogPost(post).display())
                    return
            , (err) =>
                cb(err, success: false)
                return
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
                            if cb? && typeof cb == 'function'
                                cb(null, newPost)
                , (err) =>
                    cb(err, success: false)
                    return
                
            else
                return []
        _getItems: () =>
            if @source?
                return @source.contents('posts/Corbzilla/data', false)
            return
        _getPost: (post) =>
            if @source?
                return @source.read("posts/Corbzilla/data/#{ post.name }")
            return
        _getIndex: () =>
            if @source?
                return @source.read('index.html')
            return
        
    return GithubSource