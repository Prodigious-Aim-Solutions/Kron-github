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
            $posts = $('.posts')
            @_hideAll()
            $posts.parent().show()
            $posts.find('article').show()
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
            $posts = $('.posts')
            @_hideAll()
            $posts.find('article').hide()
            if id?
                $("#post#{ id }").parents('.row').show()
                $("#post#{ id }").show()
            else
                @router.setRoute('/')
        _hideAll: () =>
            $('.row').hide()