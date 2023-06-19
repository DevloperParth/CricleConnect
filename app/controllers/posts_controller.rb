class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    @users = User.all
    @stories = Story.all
  end

  def show
    @post=Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      PostMailer.new_post(@post).deliver_now
      redirect_to controller: :posts, action: :index 
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def search 
    @user = User.search(params[:search])
  end

  private

  def post_params
    params.require(:post).permit(:add_text, :picture)
  end

end
