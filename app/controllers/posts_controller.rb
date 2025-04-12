class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_admin_user!, except: [ :index, :show ]
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.admin_user = current_admin_user
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.admin_user = current_admin_user
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully deleted."
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:tittle, :content, :category)
  end
end
