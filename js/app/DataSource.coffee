define () ->
    class DataSource
        constructor: (@_source = {}) ->
            return @
        login: (user, pass, cb) ->
            @_source.login user, pass
            return
        create: (item, cb)  =>
            @_source.create(item)
        update: (item, cb) =>
            @source.update(item)
        remove: (item, cb) =>
            @_source.remove(item)
        get: (item, cb) =>
            if item && cb
                return @_source.get(item, cb)
            else if cb && !item
                return @_source.getAll(cb)
    return DataSource