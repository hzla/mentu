class UsersController < ApplicationController
	include SessionsHelper

	def create
		User.create email: params[:email]
		render nothing: true
	end

	def update
		current_user.update_attributes params[:user]
		render nothing: true
	end

end