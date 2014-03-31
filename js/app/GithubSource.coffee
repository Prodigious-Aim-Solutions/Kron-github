define () ->
    class GithubSource
        constructor: () ->
            @source=[
                {
                    id: '1',
                    title: 'My Blog Post',
                    body: 'Interesting content!!',
                    author: 'Corbzilla',
                    tags: 'introduction',
                    date: 'March'
                },
                {
                    id: '2',
                    title: 'My Other Blog Post',
                    body: 'More ! ! Interesting content!!',
                    author: 'Corbzilla',
                    tags: 'introduction',
                    date: 'March 2'
                }
            ]
            return @
        login: (user, pass) ->
            @github = new Github
                username: user,
                password: pass,
                auth: 'basic'
            return
        create: (item) =>
            @source.push(item)
            return @
        update: (item) =>
            return @
        remove: (item) =>
            return @
        get: (item) =>
            return @
        getAll: () =>
            return @source
    return GithubSource