class PostsController < ApplicationController
  
  #before_action :configure_permitted_parameters, if: :devise_controller?
   
  def index
    binding.pry
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    set_post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
        redirect_to posts_path
    else
        render :new
    end
  end

  def edit
    set_post
  end

  def created_at
    set_post
    @post = Post.order("created_at").last
  end

  def updated_at
    set_post
    @post = Post.order("updated_at").last
  end

  def update
    set_post
    if @post.update(post_params)
        redirect_to posts_path
    else
        render :edit
    end
  end

  def destroy
    set_post
    if @post.destroy
        redirect_to posts_path
    end
  end

  private

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_in) do |user_params|
  #     user_params.permit(:name, :email)
  #    end
  # end

  def set_post
      @post = Post.find(params[:id])
  end

  def post_params
      params.require(:post).permit(:title, :body, :profile_image, :name, :facebook, :twitter, :linkedin, :summary )
  end
end

