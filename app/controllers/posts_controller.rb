class PostsController < ApplicationController
  
  before_action :require_author, only:[:edit, :destroy]
  before_action :require_login!, only: [:new, :create]
  
  def new
    @post = Post.new
    @post.author_id = current_user.id

  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
    
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(post_params)
      
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit    
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.try(:destroy)
    redirect_to sub_url(@post.sub_id)
  end
  private
  
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
  
  def require_author
    post = Post.find(params[:id])
    current_user.id == post.author_id
  end
end
