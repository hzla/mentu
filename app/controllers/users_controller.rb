class UsersController < ApplicationController
	include SessionsHelper

	def create
		session[:dream_school] = params[:user][:dream_school]
		session[:major] = params[:user][:major]
		session[:email] = params[:user][:email]
		redirect_to '/auth/facebook'
	end

	def update
		current_user.update_attributes params[:user]
		render nothing: true
	end

end