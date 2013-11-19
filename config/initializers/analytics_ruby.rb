require 'analytics-ruby'

Analytics = AnalyticsRuby            # Alias for convenience
Analytics.init({
    secret: 'd6rdf4t1pyiw3ppi07oc',  # The secret for faylio
    on_error: Proc.new { |status, msg| print msg }  # Optional error handler
})