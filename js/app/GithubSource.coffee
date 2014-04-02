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
        create: (item) =>
            return @
        update: (item) =>
            return @
        remove: (item) =>
            return @
        get: (item) =>
            return @
        getAll: () =>
            @blogPosts = []
            if @source?                
                id = 0
                @source.contents('posts/Corbzilla', false).done (posts) =>
                    for post in posts
                        title = post.name.split('.')[0].split('-').join(' ')
                        @source.read("posts/Corbzilla/#{ post.name }").done (file) =>
                            @blogPosts.push new BlogPost(id, title, file.contents, '', 'Corbzilla', 'today')
                            return
                    return
            return @blogPosts
        
    return GithubSource