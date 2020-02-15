class WidgetsController < ApplicationController
  def index
    if params[:user_id]
      add_breadcrumb "PROFILE", user_path(params[:user_id])
    end
    @widgets = Widget.all(user_id: params[:user_id], term: search_params)
  end

  private

  def search_params
    params[:term]
  end
end