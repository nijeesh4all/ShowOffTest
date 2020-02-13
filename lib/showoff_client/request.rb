class ShowoffClient
  class Request
    class << self

      def where(resource_path, query = {}, options = {})
        response, status = get_json(resource_path, query)
        status == 200 ? response : errors(response)
      end

      def get(id)
        response, status = get_json(id)
        status == 200 ? response : errors(response)
      end

      def post(resource_path, query)
        response, status = post_json(resource_path, query)
        status >= 299 ? response : errors(response)
      end

      def errors(response)
        error = {error: true, errors: {status: response["status"], message: response["message"]}}
        response.merge(error)
      end

      def get_json(root_path, query = {})
        query_string = query.map { |k, v| "#{k}=#{v}" }.join("&")
        path = query.empty? ? root_path : "#{root_path}?#{query_string}"
        response = api.get(path)
        [JSON.parse(response.body), response.status]
      end

      def post_json(root_path, query)
        path = query.empty? ? root_path : "#{root_path}"
        response = api.post(path,query.to_json)
        [JSON.parse(response.body), response.status]
      end

      def api
        ShowoffClient::Connection.api
      end

    end
  end
end
