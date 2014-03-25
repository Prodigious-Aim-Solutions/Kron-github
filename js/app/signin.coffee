define ['DataSource'], (dataSource) ->
    class SignIn
        constructor: (@ds = {}) ->
            $('.btn-signin').on 'click', @doSignIn 
            return @
        doSignIn: (e) =>
            @ds.login $('.user').val(), $('.pass').val()
            return @
    return SignIn