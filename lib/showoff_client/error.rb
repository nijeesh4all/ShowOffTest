class ShowoffClient
  class Error
    class ConfigurationOptionsInvalid < StandardError
      def message
        "
        Please make sure all the required config params are provided \n
        URL, CLIENT_ID and CLIENT_SEC are required
      "
      end
    end

    class UnprocessableRequest < StandardError;
    end

    class UnauthorisedAccess < StandardError;
    end

    class RecordNotFound < StandardError; end

  end
end