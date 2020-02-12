require 'faraday'
require 'json'

class ShowoffClient
  class ConfigurationOptionsInvalid < StandardError; end

  class API
    @@config_options = {
        CLIENT_SECRET: '',
        URL:'',
        CLIENT_ID:''
    }

    def self.default_config
      yield(@@config_options)
      raise ConfigurationOptionsInvalid unless @@config_options[:CLIENT_ID] || @@config_options[:CLIENT_SECRET] || @@config_options[:URL]
    end

    def initialize
      Faraday.new(url: @@config_options[:URL]) do |faraday|
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
        faraday.headers['Content-Type'] = 'application/json'
      end
    end
  end
end