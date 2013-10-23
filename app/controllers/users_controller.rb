class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end

  def create
    @user=User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the DevNet app!"
      sign_in @user
      redirect_to @user
    else
      render'new'
    end
  end

end