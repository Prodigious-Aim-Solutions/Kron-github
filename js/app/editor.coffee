define ['../../bower_components/marked/lib/marked', 'BlogPost', '../../bower_components/localforage/dist/localforage'], (marked, BlogPost, localForage) ->

    class Editor
        constructor:(@markdownEditor = {}) ->
            $('.btn-submit').on('click', @submitMarkdown)
            $('.title, .body').on('keyup', @startAutoSave)
            return @
        submitMarkdown:(e) =>
            blogPost = 
                title: $('.title').val()
                body: marked($('.body').val())
                tags: $('.tags').val()
                author: $('.author').val()
                date: moment()
            console.log(blogPost.body)
            return
        startAutoSave: (e) =>
            $('.title, .body').off('keyup', @startAutoSave)
            @savePost()
            autoSave = setTimeout () =>
                @savePost()
                return
            , 5000
            return
        savePost: () =>
            blogPost = 
                title: $('.title').val()
                body: marked($('.body').val())
                tags: $('.tags').val()
                author: $('.author').val()
                date: moment()
            localForage.setItem('currentPost', blogPost)
            return

    return Editor