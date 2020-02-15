require 'rails_helper'

RSpec.describe "Users", type: :request do
  it "redirects user back if not logged it" do
    get user_path(1)
    expect(response).to redirect_to root_path

    get user_path('me')
    expect(response).to redirect_to root_path
  end

  it "responds with 200 and renders layout" do
    get new_user_path
    expect(response).to be_success
    expect(response).to render_template :new
  end
end
