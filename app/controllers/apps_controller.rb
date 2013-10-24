class AppsController < ApplicationController
  include AppsHelper

  def index
    
  	@apps = App.all

    

  end

  def new
  end

  def create
  	new_app_object = App.create(params[:new_app])

  	# new_app_object = App.new(params[:new_app]).save

  	redirect_to show_app_path(new_app_object)
  end

  def show
  	@this_app = App.find(params[:id])
  end

  def edit
    @this_app = App.find(params[:id])
  end

  def update
    # select referenced app object
    updated_app_details = App.find(params[:id])

    # mass update from form params
    updated_app_details.update_attributes(params[:edited_app])

    # redirect
    redirect_to show_app_path(updated_app_details)
  end  

  def destroy
    # get app ID before deleting review
    current_app_id = App.find(params[:id])

    # select and delete review
    App.delete(params[:id])

    # redirect
    redirect_to "/apps"
  end

end
