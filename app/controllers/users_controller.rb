class UsersController < ApplicationController
	include SessionsHelper

	def create
		@user = User.create params[:user]
		session[:user_id] = @user.id
		redirect_to root_path(sign_in: true, sign_up: true)
	end

	def show
		@user = User.find params[:id]
		@edit_mode = @user == current_user
	end

	def update
		current_user.update_attributes params[:user]
		if params[:ama]
			ama = Ama.find params[:ama]
			redirect_to ama_path(id: ama.id, code: ama.mentor_code) and return
		end
		if request.xhr?
			render nothing: true
		else
			redirect_to user_path(current_user)
		end
	end

end