class UsersController < ApplicationController
  before_action :authenticate_user


  private
  def search_params
    params[:term]
  end
end
