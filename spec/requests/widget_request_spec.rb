require 'rails_helper'

RSpec.describe "Widgets", type: :request do
  context  "un authenticated user" do
    it "redirects user back if not logged it" do
      get user_widgets_path('me')
      expect(response).to redirect_to root_path

      get user_widgets_path(1)
      expect(response).to redirect_to root_path

      get new_user_widget_path('me')
      expect(response).to redirect_to root_path
    end

    it "respond with 200 and renders layout" do
      get widgets_path
      expect(response).to be_success
      expect(response).to render_template :index
    end
  end
end
