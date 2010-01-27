require 'yaml'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

# Load application and environment constants.
APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")[RAILS_ENV]

Rails::Initializer.run do |config|
  # Specify gems that this application depends on and have them installed with rake gems:install
  config.gem "haml", :version => '2.2.13'
  config.gem "rspec", :lib => false, :version => '1.3.0'
  config.gem "rspec-rails", :lib => false, :version => '1.3.2'

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # For user activation in Restful Authentication.
  config.active_record.observers = :user_observer

  # Secret key for verifying cookie session data integrity.
  config.action_controller.session = {
    :session_key => APP_CONFIG['settings']['session_key'],
    :secret      => APP_CONFIG['settings']['secret']
  }
end
