class UsersController < ApplicationController
	include SessionsHelper

	def create
		@user = User.create params[:user]
		session[:user_id] = @user.id
		redirect_to root_path(sign_in: true, sign_up: true)
	end

	def update
		current_user.update_attributes params[:user]
		if params[:ama]
			ama = Ama.find params[:ama]
			redirect_to ama_path(id: ama.id, code: ama.mentor_code)
		end
	end

end