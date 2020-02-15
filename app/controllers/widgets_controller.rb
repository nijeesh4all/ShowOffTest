class WidgetsController < ApplicationController

  before_action :authenticate_user, except: [:index]

  def index
    if params[:user_id]
      add_breadcrumb "PROFILE", user_path(params[:user_id])
    end
    @widgets = Widget.all(user_id: params[:user_id], term: search_params)
  end

  def new
    @widget = Widget.new
    add_breadcrumb "PROFILE", user_path(params[:user_id])
  end

  def create
    @widget = Widget.new widget_params
    @widget.create!
    @error = !@widget.valid?
    @message = @widget.errors || "Widget Successfully created"
  end

  def update
    @widget = Widget.new(id: params[:id])
    @widget.update! widget_params
    @error = !@widget.valid?
    @message = @widget.errors || "Widget Successfully updated"
  end

  private

  def search_params
    params[:term]
  end

  def widget_params
    params.require(:widget).permit(:name, :description, :kind)
  end

  def set_widget
    @widget = Widget.find()
  end

end