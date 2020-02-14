class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all(user_id: params[:user_id], term: search_params)
  end

  private

  def search_params
    params[:term]
  end
end