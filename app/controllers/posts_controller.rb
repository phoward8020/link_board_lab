class PostsController < ApplicationController

before_action :is_authenticated?

  def new
    # render plain: "Form for new Post goes here"
    @post = Post.new
    @user = current_user
  end

  def create
    # render plain: "Code to validate/create new Post goes here."
    @user = current_user
    @post = @user.posts.create(post_params)
    
    if @post.errors.any?
      # fail
      # return render json: @post.errors
      flash[:danger] = "Post could not be created."
      render :new
    else
      #win
      # return render json: @post
      flash[:success] = "Post successfully created."
      redirect_to root_path
    end

  end

  def edit
    render plain: "Form to edit Posts goes here"
  end

  def update
    render plain: "Code to validate/udpate Posts goes here"
  end

  def destroy
    render plain: "Code to destroy Post goes here."
  end

  private
    def post_params
      params.require(:posts).permit(:title, :link)
    end

end