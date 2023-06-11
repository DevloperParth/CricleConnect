class CommentsController < ApplicationController
  def index
    @commnets =Comment.all
  end
  def new 
  @comment = Comment.new 
  end
  def create
    @comment = current_user.comments.new(comment_params) 
     
    if @comment.save
      redirect_to @comments, notice: 'Comment created successfully.'
    else
      render :new
  end
end
  
  private

  def comment_params
    params.require(:comment).permit(:comment)
    .merge(post_id: params[:post_id])
  end
end

