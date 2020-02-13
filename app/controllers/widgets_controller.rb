class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all(term: search_params)
  end


  private

  def search_params
    params[:term]
  end
end