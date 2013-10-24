class FeedbacksController < ApplicationController

  def index
    # bindings.pry
    @all_feedbacks = Feedback.where(app_id: params[:id])    
  end

  def new
  	@new_feedback = Feedback.new
    @new_feedback.app_id = params[:id]
  	#put this back in later
  	#<%= App.find(@new_feedback.app_id).app_name %>
  end

  def create
  	my_new_review = Feedback.create(params[:new_review])    
  	redirect_to "/apps/#{my_new_review.app_id}/feedbacks/#{my_new_review.id}/show"
  end

  def show
    @this_feedback = Feedback.find(params[:id])
  end

  def edit
    @this_feedback = Feedback.find(params[:id])
  end

  def update #like create
    # select feedback instance to be changed
    updated_feedback = Feedback.find(params[:id])

    # mass assign all changed attributes
    updated_feedback.update_attributes(params[:new_review])

    # redirect
    redirect_to "/apps/#{updated_feedback.app_id}/feedbacks/#{updated_feedback.id}/show"
  end

  def destroy
    # get app ID before deleting review
    current_app_id = Feedback.find(params[:id]).app_id

    # select and delete review
    Feedback.delete(params[:id])

    # redirect
    redirect_to "/apps/#{current_app_id}/show"

  end


end
