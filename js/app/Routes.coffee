define () ->
    class Routes
        constructor: (@ds = {}) ->
            routes =
                '/': @main,
                '/edit': @edit,
                '/edit/:id': @edit,
                '/display/:id': @post
            @router = Router(routes)
            @router.init()
            return @
        main: () =>
            @_hideAll()
            $('.posts').parent().show()
            return @
        edit: (id) =>
            $editor = $('.editor')
            @_hideAll()
            $editor.parent().show()
            if id?
                post = @ds.get(id)
                $editor.find('.title').val(post.title)
                $editor.find('.body').val(post.body)
                $editor.find('.author').val(post.author)
                $editor.find('.tags').val(post.tags)
            $editor.show()
            return @
        post: (id) =>
            $post = $('.post')
            @_hideAll()
            if id?
                post = @ds.get(id)
                $post.find('.title').val(post.title)
                $post.find('.body').val(post.body)
                $post.find('.author').val(post.author)
                $post.find('.tags').val(post.tags)
                $post.find('.date').val(post.date)
            else
                @router.setRoute('/')
        _hideAll: () =>
            $('.row').hide()