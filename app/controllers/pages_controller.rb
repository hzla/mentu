class PagesController < ApplicationController
	include SessionsHelper
	skip_before_action :require_login

	def home
		if current_user && !current_user.has_filled_out_basic_info
			@show_welcome_modal = true	
		end
		@user = User.new
	end

	def faq
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