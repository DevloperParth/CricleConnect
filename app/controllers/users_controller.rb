class UsersController < ApplicationController

  def index 
    @users1=User.all
    @q =User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
end
