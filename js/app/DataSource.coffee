define () ->
    class DataSource
        constructor: (@_source = {}) ->
            return @
        login: (user, pass) ->
            @_source.login
                user: user,
                pass: pass
            return
        create: (item)  =>
            @_source.create(item)
        update: (item) =>
            @source.update(item)
        remove: (item) =>
            @_source.remove(item)
        get: (id) =>
            if id
                return @_source.get(id)
            else
                return @_source.getAll()
    return DataSource