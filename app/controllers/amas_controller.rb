class AmasController < ApplicationController
	include SessionsHelper

	def show
		@ama = Ama.find(params[:id])
		@mentor = @ama.user
		@question = Comment.new(ama_id: @ama.id, comment_type: "question")
		@questions = @ama.questions
		@current_mentor = @ama.user == current_user

		if params[:code] == @ama.mentor_code
			render "mentor_show" and return
		end
	end

	def update
		@ama = Ama.find(params[:id])
		@ama.update_attributes params[:ama]
		render nothing: true;
	end

	def index
		@amas = Ama.date_grouped_amas(params[:category])
		render partial: "index"	 
	end

end
