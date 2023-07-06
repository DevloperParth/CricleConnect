class StoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.create(story_params)
    if @story.save
      redirect_to posts_path, notice: 'Story created successfully.'
     else 
      flash[:alert] = 'Story could not be created.'
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  private

  def story_params
    params.require(:story).permit(:content, :image, :expires_at)
  end
end
