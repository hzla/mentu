class AmasController < ApplicationController
	include SessionsHelper

	def show
		@ama = Ama.find(params[:id])
		@mentor = @ama.user
		@question = Comment.new(ama_id: @ama.id, comment_type: "question")
		@questions = @ama.questions
		@current_mentor = @ama.user == current_user
	end

	def index
		@amas = Ama.date_grouped_amas(params[:category])
		render partial: "index"	 
	end

end
