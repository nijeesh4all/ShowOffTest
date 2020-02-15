class WidgetsController < ApplicationController

  before_action :authenticate_user, except: [:index]
  before_action :set_widget, only: [:destroy, :update]

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
    @widget.update! widget_params
    @error = !@widget.valid?
    @message = @widget.errors || "Widget Successfully updated"
  end

  def destroy
    @widget.destroy
    if @widget.valid?
      flash[:success] = "Widget deleted Successfully "
    else
      flash[:notice] = @widget.errors
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def search_params
    params[:term]
  end

  def widget_params
    params.require(:widget).permit(:name, :description, :kind)
  end

  def set_widget
    @widget = Widget.new(id: params[:id])
  end

end