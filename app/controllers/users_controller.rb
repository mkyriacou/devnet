class UsersController < ApplicationController

  
  def show
    @user = User.find(params[:id])
    @app = App.find_by_user_id(@user.id)

  end

  def new
    @user = User.new()
  end

  def create
    #insert the line below into /users/show
    #my_app = App.find_by user_id: current_user.id
   
    
    @user=User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the DevNet app!"
      sign_in @user
      

      redirect_to "/users/#{current_user.id}"
    else
      render'new'
    end
  end

end