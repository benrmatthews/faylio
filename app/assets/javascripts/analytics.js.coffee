analytics.identify('<%= current_user.id %>', {
    email   : '<%= current_user.email %>',
    created : '<%= current_user.created %>'
}, {
    Intercom : {
        userHash : '<%= OpenSSL::HMAC.hexdigest("sha256", "lZTwnxhmIGUqyXyzbgzX4QkL8er4NHOeeH0FOGuH ", current_user.id) %>'
    }
});