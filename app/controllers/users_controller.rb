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
		if params[:link_click_count]
			current_user.update_attributes link_click_count: params[:link_click_count]
		end
		redirect_to root_path if params[:user] && params[:user][:role] == "admin"
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

	def activate
		code = Code.where(body: params[:code])
		if code.first && code.first.user.nil?
			current_user.codes << code
			render json: {activation_text: "Your account is now activated! For supporting us so early, you also get a beta user badge next to your name."} and return
		else
			render json: {activation_text: "Sorry, that code is invalid or has already been claimed. If you lose your code you can contact support@spark.com to get a new one."}
		end
	end

end