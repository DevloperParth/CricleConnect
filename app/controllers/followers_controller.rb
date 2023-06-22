class FollowersController < ApplicationController

  def index
    @users = User.all
  end
end
