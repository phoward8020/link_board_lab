class SessionsController < ApplicationController

  def new
    @user = User.new
    # render plain: "This is the login page."
  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])
    
    if @user
      session[:user_id] = @user.id
      flash[:success] = "User logged in"
      redirect_to root_path
    else
      flash[:error] = "Login Fail!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:warning] = "Logged Out"
    redirect_to login_path
  end

end