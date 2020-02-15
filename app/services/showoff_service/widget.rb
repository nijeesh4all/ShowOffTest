module ShowoffService
  class Widget < Base

    def self.user_all(user_id:'me', search_term:nil)
      url = "users/#{user_id}/widgets"
      params = {}
      params[:term] = search_term if search_term
      response = ShowoffClient::Request.where(url, params)
      return response
    end

    def self.visible(search_term=nil)
      url = "widgets/visible"
      params={}
      params[:term] = search_term if search_term
      response = ShowoffClient::Request.where(url, params)
      return response
    end

    def self.create(attributes)
      attributes.delete(:id) if attributes.has_key?(:id)
      attributes.delete(:owner) if attributes.has_key?(:owner)
      url = 'widgets'
      response, status = ShowoffClient::Request.post_json(url, {widget: attributes})
      return response
    end

    def self.update(widget_id, attributes)
      attributes.delete(:id) if attributes.has_key?(:id)
      url = "widgets/#{widget_id}"
      response, status = ShowoffClient::Request.put_json(url, {widget: attributes})
      return response
    end

    def self.destroy(widget_id)
      url = "widgets/#{widget_id}"
      response, status = ShowoffClient::Request.delete_json(url)
      return response
    end

  end
end