class UsersController < ApplicationController

  
  def show
    @user = User.find(params[:id])
    @app = App.find_by_user_id(@user.id)
    if @app == nil
      @my_bools = {:useful_vote => 0, :enjoyable_vote => 0, :sleek_vote  => 0, :ui_vote => 0}
    else
      @my_bools = @app.sum_bools
    end

    # binding.pry
    
    # this has been temporarily removed from the form:
 # <h2>My Account</h2>
 #  <ul>
 #    <li><%= link_to "Feedback I've Given others", '' %></li>
 #    <li><%= link_to "Edit Account Details", "/users/#{current_user.id}" %></li>
 #  </ul>
 #    <li><%= link_to "INVITE more contacts to join your community (UNDER CONSTRUCTION)", '#' %></li>



  end

  def new
    @user = User.new()
  end

  def index
    @all_users = User.all
    @all_apps = App.all
     # <% this_app = @all_apps.find_by_user_id(this_user.id) %>
      # <BR> Creator of <%= @all_apps.find(user_id: this_user.id).app_name %>
# <img src="<%= this_app.img_link %>" height="200px">
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