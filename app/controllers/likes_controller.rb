class LikesController < ApplicationController

  def create 
    @like = current_user.likes.new(like_params)
    if @like.save
      flash[:atert] = "You already liked"
    end
    respond_to do |format|
      format.json { head :no_content }
      format.js   { render :layout => false }
   end
  end

  private
  
  def like_params
    params.require(:like).permit(:post_id)
  end
end
