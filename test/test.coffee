requirejs.config
    baseUrl: '../js/app'
    paths:
        octokit: '../../bower_components/octokit/octokit'
        underscore: '../../bower_components/underscore/underscore'
        jquery: '../../bower_components/jquery/dist/jquery'
        mocha: '../../bower_components/mocha/mocha'
        should: '../../bower_components/should/should'


require ['should','main', 'editor', 'BlogPost', 'DataSource','signin' ,'mocha'], (Should, app, Editor, BlogPost, DataSource, SignIn) ->
    mocha.setup('bdd');
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
            it 'should have an id', () ->
                Should.exists(post.id)
                return
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
            
        describe 'DataSource', () ->
            ds = new DataSource()
            it 'should have a login method', () ->
                ds.should.have.ownProperty('login')
                return
            it 'should have a create method', () ->
                ds.should.have.ownProperty('create')
                return
            it 'should have an update method', () ->
                ds.should.have.ownProperty('update')
                return
            it 'should have a remove method', () ->
                ds.should.have.ownProperty('remove')
                return
            it 'should have a get method', () ->
                ds.should.have.ownProperty('get')
                return
        describe 'SignIn', () ->
            signin = new SignIn()
            it 'should have a datasource', () ->
                Should.exists(signin.ds)
        return
    mocha.run();
    return
        