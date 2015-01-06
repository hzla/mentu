class AdminsController < ApplicationController
	include SessionsHelper
	before_filter :check_admin

	def index
		@users = User.all.select{|u| u.is_mentor}
	end

	def show
		@user = User.find params[:id]
	end


	private

	def check_admin
		if !current_admin
			redirect_to root_path
		end
	end
end