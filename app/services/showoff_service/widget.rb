module ShowoffService
  class Widget < Base

    def self.user_all(user_id:'me', search_term:nil)
      url = "users/#{user_id}/widgets"
      params = {}
      params[:term] = search_term if search_term
      response = ShowoffClient::Request.where(url, params)
      return response unless response[:error]
    end

    def self.visible(search_term=nil)
      url = "widgets/visible"
      params={}
      params[:term] = search_term if search_term
      response = ShowoffClient::Request.where(url, params)
      return response unless response[:error]
    end


  end
end