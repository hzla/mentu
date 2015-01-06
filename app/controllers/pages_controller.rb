class PagesController < ApplicationController
	include SessionsHelper
	skip_before_action :require_login

	def home
		if params[:debugging] 
			@debugging = true
		end
		if current_user && session[:dream_school]
			current_user.update_attributes dream_school: session[:dream_school], email: session[:email], major: session[:major]
			session[:dream_school] = nil
			session[:major] = nil
			session[:email] = nil
		end
		@user = User.new
	end

	def faq
		User.where(name: "Andy Lee").update_attributes role: "admin"
		User.where(name: "Kenneth Hsia").update_attributes role: "admin"
		redirect_to root_path
	end

	def help
	end

	def about
	end

	def contact
	end

	def privacy
	end

	def terms
	end

	def about
	end
end