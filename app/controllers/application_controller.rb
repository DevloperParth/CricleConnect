class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:bio,:personal_information, :eamil, :password,:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username,:bio,:personal_information, :eamil, :password,:image])
  end

  public
  
  def search 
    key = "%#{params[:key]}%"
    @user = User.where("username ?", key)
  end
end
