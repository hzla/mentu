module Upmin
  class ApplicationController < ActionController::Base
    before_filter :is_admin?

    def is_admin?
    	current_user = User.find session[:user_id]
      redirect_to "/" and return if current_user.role != "admin" 
    end
  end
end