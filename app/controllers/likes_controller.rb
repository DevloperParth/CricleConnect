class LikesController < ApplicationController

  def create 
  @like = current_user.likes.new(like_params)
    if @like.save
      flash[:atert] = "you already liked"
    end
    redirect_to posts_path
  end
      
  def destroy
    @like = Current_user.likes.find(params[:id])
    @like.destroy
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
