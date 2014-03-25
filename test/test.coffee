require ['../js/app/main', '../js/app/editor', '../js/app/BlogPost'], (app, Editor, BlogPost) ->
    describe 'App', () ->
        describe 'Global App', () ->
            it 'app should exist', () ->
                Should.exists(app)
                return
            return
        describe 'Editor', () ->
            editor = new Editor()
            it 'should exists', () ->            
                Should.exist(editor)
                return
            it 'should have a markdown editor', () ->
                Should.exist(editor.markdownEditor)
                return
            return
        describe 'BlogPost', () ->
            post = new BlogPost()
            it 'should have a title', () ->            
                Should.exists(post.title)
                return
            it 'should have a body', () ->
                Should.exists(post.body)
                return
            it 'should have a tags', () ->
                Should.exists(post.tags)
                return
            it 'should have an author', () ->
                Should.exists(post.author)
                return
            it 'should have a date', () ->
                Should.exists(post.date)
                return
        return
        