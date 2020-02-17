require 'rails_helper'
RSpec.describe "Auths", type: :request do
  context "non logged user" do
    it "redirects user back if not logged it" do
      delete logout_path
      expect(response).to redirect_to root_path
    end

    it "gives 200 response and render template" do
      get login_path, xhr: true
      expect(response).to render_template :new
      expect(response).to be_success

      post login_path, params: { email: Faker::Internet.email, commit: 'check_email' } ,xhr: true
      expect(response).to be_success
      expect(response).to render_template(:partial => '_check_email')

      get forgot_password_path, xhr: true
      expect(response).to be_success
      expect(response).to render_template(:edit)
    end
  end

  context "logged in user" do
    before(:each) do
      @user = build(:user)
      @user.create!
    end


    it "logs user out" do
      delete logout_path
      expect(response).to redirect_to root_path
    end

  end
end
