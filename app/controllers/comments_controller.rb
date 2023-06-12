class CommentsController < ApplicationController
  def index
    @comments = @post.comments.includes(:user)
  end
  def new 
  @comment = Comment.new 
  end
  def create
    @comment = Comment.create(comment_params) 
      
    if @comment.save
      @post = @comment.post

      flash[:notice] = "Successfully created"
    else
      flash[:alert] = "Something went wrong ..."
  end
end
  
  private

  def comment_params
    params.require(:comment).permit(:comment,:user_id,:post_id)
    
  end
end

