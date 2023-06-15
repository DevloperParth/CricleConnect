class StoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @stories=Story.all
  end
 

  def new
    
  end

  def create
    @story = current_user.stories.new(story_params)
    @story.expires_at = 24.hours.from_now

    if @story.save
      redirect_to posts_path, notice: 'Story created successfully.'
     else
      flash[:alert] = 'Story could not be created.'
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
    if @story.expires_at > Time.now
      render :show
    else
      redirect_to root_path, alert: 'Story has expired.'
    end
  end

  private

  def story_params
    params.require(:story).permit(:content)
  end
end
