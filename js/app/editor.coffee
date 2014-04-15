define ['../../bower_components/marked/lib/marked', 'BlogPost', '../../bower_components/localforage/dist/localforage'], (marked, BlogPost, localForage) ->

    class Editor
        constructor:(@ds = {}, @markdownEditor = {}) ->
            $('.btn-submit').on 'click', @submitMarkdown
            $('.title, .body').on 'keyup', @startAutoSave
            return @
        submitMarkdown:(e) =>
            blogPost = 
                title: $('.title').val()
                body: $('.body').val()
                tags: $('.tags').val()
                author: $('.author').val()
                date: moment()
            @ds.create(blogPost)
            $('.editor input, .editor textarea').val('')
            window.location.hash = '#/'
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
        onComplete: (err, data) =>
            if err? or data.success == false
                $('.editor error').show()
                $('.editor error').text("Could Not Add Resource")
            else
                $('.editor error').hide()
            return

    return Editor