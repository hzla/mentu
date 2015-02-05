class SessionsController < ApplicationController
	include SessionsHelper
	skip_before_action :require_login


	def facebook_create
		  # redirect_to events_path and return if current_user
		  auth_hash = request.env['omniauth.auth']
		  auth = Authorization.find_by_uid auth_hash['uid']
		  #redirect to user page if they've already authorized
		  if auth
		    session[:user_id] = auth.user.id
		    redirect_to root_path(sign_in: true) and return
		  else #create new user if not authorized
		    user = User.create_with_facebook auth_hash
		    session[:user_id] = user.id 
		    redirect_to root_path({sign_in: true, sign_up: true}) and return
		  end
	end

	def create
		@user = authenticate(params)
		if @user
	    sign_in(@user) do |status|
      	session[:user_id] = @user.id
        redirect_to root_path(sign_in: true) and return
	    end
	  else
	  	redirect_to root_path sign_in: false
	  end

	end

	def destroy
		current_user.update_attributes active: false;
		session[:user_id] = nil
		redirect_to root_path
	end
end