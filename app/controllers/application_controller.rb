class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper
  before_action :set_device_type
  # before_action :require_login

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end


  private

  def require_login
    user = current_user
    unless user
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path and return
    end
  end

  def set_device_type
    request.variant = :phone if browser.mobile?
  end
  
end
