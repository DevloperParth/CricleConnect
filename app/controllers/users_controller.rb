class UsersController < ApplicationController

  def index 
   @post = Post.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user=User.all
  end
end
