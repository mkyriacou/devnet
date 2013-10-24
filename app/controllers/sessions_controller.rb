class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user=User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      # Sign the user in and redirect to the user's show page.
       # User authenticate will take the encrypted password from the DB, decrypt it and compare to the entererd password value...
       # Create the session
       # We dont' want a ton of logic in our controllers so we are going to abstract that away to the sessions_helper.rb

      sign_in user
      redirect_to "/users/#{user.id}"
    else
      # Create an error message and re-render the signin form.
      flash.now[:error]='Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
      sign_out
      redirect_to '/'
  end

end
