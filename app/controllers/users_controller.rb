class UsersController < ApplicationController

	def create
		User.create email: params[:email]
		render nothing: true
	end

end