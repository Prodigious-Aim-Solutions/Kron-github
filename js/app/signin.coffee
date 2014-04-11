define ['DataSource'], (dataSource) ->
    class SignIn
        constructor: (@ds = {}) ->
            $('.btn-signin').on 'click', @doSignIn
            $('.signin input').on 'keyup', @doSignIn
            return @
        doSignIn: (e) =>
            if e.type == 'click' or (e.type == 'keyup' and e.which == 13)
                @ds.login $('.user').val(), $('.pass').val()
                $('.user').val('')
                $('.pass').val('')
                window.location.hash = '#/'
            return @
    return SignIn