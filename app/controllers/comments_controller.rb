class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
  end
  
    def show
      @comment = Comment.find(params[:id])
      render :show
    end
  
  def create
    @comment = Comment.new(comment_params)
    
    @comment.save
    flash[:errors] = @comment.errors.full_messages
    redirect_to post_url(@comment.post_id)

  end
    
  private
  
  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id, :parent_comment_id)
  end
  
end
