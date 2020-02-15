require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require 'active_model/validations'

#TODO: change this
require_relative '../lib/showoff_client/connection'
require_relative '../lib/showoff_client/request'
require_relative '../lib/showoff_client/error'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Showoff
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = false

    config.middleware.use ActionDispatch::Flash

    Dotenv::Railtie.load

    ShowoffClient::Connection.default_config do |config|
      config[:URL] = ENV['SHOWOFF_URL']
      config[:CLIENT_SECRET] = ENV['SHOWOFF_CLIENT_SECRET']
      config[:CLIENT_ID] = ENV['SHOWOFF_CLIENT_ID']
    end

  end
end
