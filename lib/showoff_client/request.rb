class ShowoffClient
  class Request
    class << self

      def where(resource_path, query = {}, options = {})
        response, status = get_json(resource_path, query)
        status == 200 ? response : errors(response)
      end

      def errors(response)
        error = {error: true, errors: {status: response["status"], message: response["message"]}}
        response.merge(error)
      end

      def get_json(root_path, query = {})
        query_string = query.map { |k, v| "#{k}=#{v}" }.join("&")
        path = query.empty? ? root_path : "#{root_path}?#{query_string}"
        response = api.get(path)
        response_data = JSON.parse(response.body)
        throw_corresponding_errors response_data, response.status
        [response_data, response.status]
      rescue JSON::ParserError
        throw ShowoffClient::Error::UnprocessableRequest
      end

      def post_json(root_path, query)
        path = query.empty? ? root_path : "#{root_path}"
        response = api.post(path,query.to_json)
        response_data = JSON.parse(response.body)
        throw_corresponding_errors response_data, response.status
        [response_data, response.status]
      rescue JSON::ParserError
        throw ShowoffClient::Error::UnprocessableRequest
      end

      def put_json(root_path, query)
        path = query.empty? ? root_path : "#{root_path}"
        response = api.put(path,query.to_json)
        response_data = JSON.parse(response.body)
        throw_corresponding_errors response_data, response.status
        [response_data, response.status]
      rescue JSON::ParserError
        throw ShowoffClient::Error::UnprocessableRequest
      end

      def delete_json(root_path)
        path = root_path
        response = api.delete(path)
        response_data = JSON.parse(response.body)
        throw_corresponding_errors response_data, response.status
        [response_data, response.status]
      rescue JSON::ParserError
        throw ShowoffClient::Error::UnprocessableRequest
      end

      private

      def api
        ShowoffClient::Connection.api
      end

      def throw_corresponding_errors(response, status)
        case response[:code]
        when 10
          raise ShowoffClient::Error::UnauthorisedAccess
        when 3
          raise ShowoffClient::Error::UnprocessableRequest
        end

        case status
        when 401
          raise ShowoffClient::Error::UnauthorisedAccess
        end
      end

    end
  end
end
