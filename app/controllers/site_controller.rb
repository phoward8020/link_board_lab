class SiteController < ApplicationController

  def index
    # render plain: "Hola"
    @user = current_user
    @posts = Post.all
  end

end