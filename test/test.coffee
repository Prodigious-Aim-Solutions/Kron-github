
describe 'App', () ->
    describe 'Global App', () ->
        it 'should exist in the window namespace', () ->
            Should.exists(window.App)
            return
        it 'should have an editor namespace', () ->
            Should.exists(window.App.Editor)
            return
        return
    describe 'Editor', () ->
        it 'should exists', () ->
            editor = new window.App.Editor()
            Should.exist(editor)
            return
        it 'should have a markdown editor', () ->
            editor = new window.App.Editor()
            Should.exist(editor.markdownEditor)
            return
        return
    describe 'BlogPost', () ->
        post = new window.App.BlogPost()
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
        