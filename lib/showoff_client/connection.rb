require 'faraday'
require 'json'

class ShowoffClient
  class ConfigurationOptionsInvalid < StandardError;
  end
  class Connection
    @@config_options = {
        CLIENT_SECRET: '',
        URL: '',
        CLIENT_ID: ''
    }

    CONTENT_TYPE = 'application/json'

    def self.default_config
      yield(@@config_options)
      unless @@config_options[:CLIENT_ID] || @@config_options[:CLIENT_SECRET] || @@config_options[:URL]
        raise ConfigurationOptionsInvalid
      end
    end

    def self.api
      Faraday.new(url: @@config_options[:URL],
                  params: {
                      client_secret: @@config_options[:CLIENT_SECRET],
                      client_id: @@config_options[:CLIENT_ID]
                  }) do |faraday|

        faraday.response :logger
        faraday.adapter Faraday.default_adapter
        faraday.headers['Content-Type'] = CONTENT_TYPE
      end
    end
  end
end
