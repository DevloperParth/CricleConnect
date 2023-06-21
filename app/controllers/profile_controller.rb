class ProfileController < ApplicationController
 before_action :set_user

  def show
    @posts = Post.all
  end

  def follow
    current_user.send_follow_request_to(@user)
    redirect_to profile_path(@user),
    notice: 'you have successfully reauested'
  end

  def block
    current_user.block(@user)
    redirect_to profile_path(@user)
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to profile_path(@user)
  end

  def accept
    current_user.accept_follow_request_of(@user)
    make_it_a_friend_request
    redirect_to profile_path
  end

  def decline
    current_user.decline_follow_request_of(@user)
    redirect_to profile_path(@user)
  end

  def cancel
    current_user.remove_follow_request_for(@user)
    redirect_to profile_path(@user)
  end

  def make_it_a_friend_request
    current_user.send_follow_request_to(@user)
    @user.accept_follow_request_of(current_user)
  end

  def make_it_unfriend_request
    @user.unfollow(current_user) if @user.mutual_following_with?(current_user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to controller: :users, action: :index, status: :see_other
  end

  private
  
  def set_user
    @user=User.find(params[:id])
    @posts=Post.all
  end
end
