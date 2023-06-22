class LikesController < ApplicationController

  def create 
  @like = current_user.likes.new(like_params)
    if @like.save
      flash[:atert] = "you already liked"
    end
    respond_to do |format|
     
      format.json { head :no_content }
      format.js   { render :layout => false }
   end
  end
      
  def destroy
    
    @like = current_user.likes.find(params[:id])
    @like.destroy
  end

  def like_params
    params.require(:like).permit(:post_id)
  end

end
