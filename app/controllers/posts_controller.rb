class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    post_param = params[:post]
    @post = Post.new(title: post_param[:title], body: post_param[:body])
    if @post.save
        redirect_to posts_path
    else
        render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    post_param = params[:post]
    if @post.update(title: post_param[:title], body: post_param[:body])
        redirect_to posts_path
    else
        render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
        redirect_to posts_path
    end
  end
end

