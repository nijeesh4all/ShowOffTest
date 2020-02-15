require 'rails_helper'

RSpec.describe "Auths", type: :request do
  it "redirects user back if not logged it" do
    get user_widgets_path('me')
    expect(response).to redirect_to root_path
  end
end
