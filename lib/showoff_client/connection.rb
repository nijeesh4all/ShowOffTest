require 'faraday'
require 'json'

class ShowoffClient
  class ConfigurationOptionsInvalid < StandardError;
  end
  class Connection
    @@config_options = {
        CLIENT_SECRET: '',
        URL: '',
        CLIENT_ID: '',
        AUTH_TOKEN: nil
    }

    CONTENT_TYPE = 'application/json'

    def self.default_config
      yield(@@config_options)
      unless @@config_options[:CLIENT_ID] || @@config_options[:CLIENT_SECRET] || @@config_options[:URL]
        raise ConfigurationOptionsInvalid
      end
    end

    def self.api
      params = {
          client_secret: @@config_options[:CLIENT_SECRET],
          client_id: @@config_options[:CLIENT_ID]
      }

      Faraday.new(url: @@config_options[:URL], params: params) do |faraday|
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
        faraday.headers['Content-Type'] = CONTENT_TYPE
        if @@config_options[:AUTH_TOKEN].present?
          faraday.headers['Authorization'] = "Bearer #{@@config_options[:AUTH_TOKEN]}"
        end
      end
    end
  end
end
