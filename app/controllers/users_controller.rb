class UsersController < ApplicationController

  def search 
    @users = User.search(params[:search])
  end

  private
  def params
    params.require(:users).permit(:username, :password)
  end
end
