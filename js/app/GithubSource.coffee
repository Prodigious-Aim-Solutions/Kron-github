define () ->
    class GithubSource
        constructor: () ->
            return @
        login: (user, pass) ->
            @github = new Github
                username: user,
                password: pass,
                auth: 'basic'
            return
        create: (item) =>
            return @
        update: (item) =>
            return @
        remove: (item) =>
            return @
        get: (item) =>
            return @
        getAll: () =>
            return [
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
    return GithubSource