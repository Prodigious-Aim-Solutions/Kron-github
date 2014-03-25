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
            return @
    return GithubSource