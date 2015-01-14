class UsersController < ApplicationController

  def new
    # render plain: "Signup form goes here."
    @user = User.new
  end

  def create
    # render plain: "User creation code goes here."
    @user = User.new(user_params)
    @user.save
    if @user.errors.any?
      #fail
      flash[:warning] = "Account could not be created."
      render :new
    else
      #win
      flash[:success] = "Account successfully created. Please login."
      redirect_to :login
    end

  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end