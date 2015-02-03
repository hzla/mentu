class PagesController < ApplicationController
	include SessionsHelper
	skip_before_action :require_login

	def home
		if params[:debugging] 
			@debugging = true
		end
		@show_modal = params[:sign_in] == "true" || @debugging
		if current_user && session[:dream_school]
			current_user.update_attributes dream_school: session[:dream_school], email: session[:email], major: session[:major]
			session[:dream_school] = nil
			session[:major] = nil
			session[:email] = nil
		end
		@user = User.new
	end

	def faq
		User.where(name: "Andy Lee").first.update_attributes role: "admin"
		User.where(name: "Kenneth Hsia").first.update_attributes role: "admin"
		redirect_to root_path
	end

	def opentok
		@opentok = OpenTok::OpenTok.new ENV['OPEN_TOK_KEY'], ENV['OPEN_TOK_SECRET']
		session_id = "1_MX40NTEzMDcwMn5-MTQyMTgxNDQ1NjQwNH4xaFRrN0JVZTZYMzV0VytnQ1RrNzRNNGV-UH4"
  	@token = @opentok.generate_token session_id 
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