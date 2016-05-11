Biola Logs
==========

A simple gem to standardize log formatting across all our Rails apps using [lograge](https://github.com/roidrage/lograge).

Usage
-----

Add the following to your `Gemfile`

```ruby
gem 'biola_logs'
```

Biola Logs doesn't include PID and timestamp, so assuming you want those you'll need to add the following to your environment file(s) (eg. /config/environments/production.rb)

```ruby
# Use default logging formatter so that PID and timestamp are not suppressed.
config.log_formatter = ::Logger::Formatter.new
```

To log `session_id`, `request_id` (or uuid), and `host_name` you need to add the following custom variables to payload in your controller. The `Headers` generator will pull these custom variables out and add them to the hash passed to lograge's `custom_options` config method.

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include BiolaLogs::ControllerExtensions if defined?(BiolaLogs::ControllerExtensions)
end
```

Generators
----------

Generators inherit from the `Base` class and should override the `to_hash` method. `Generators.handler` merges the returned hash from each generator to populate `config.lograge.custom_options` in railtie.rb.

License
-------

MIT
