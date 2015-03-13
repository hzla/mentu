class PagesController < ApplicationController
	include SessionsHelper
	skip_before_action :require_login

	def home
		@amas = Ama.date_grouped_amas "all"
		@error_message = params[:error_message]
		@user = User.new
		@new_user = params[:sign_up] == "true"
	end

	def faq
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