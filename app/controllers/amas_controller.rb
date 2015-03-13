class AmasController < ApplicationController
	include SessionsHelper
	include ApplicationHelper


	def show
		@ama = Ama.find(params[:id])
		@user = User.new
		@mentor = @ama.user
		@question = Comment.new(ama_id: @ama.id, comment_type: "question")
		@questions = @ama.questions
		@current_mentor = @ama.user == current_user

		if params[:code] == @ama.mentor_code
			render "mentor_show" and return
		end
	end

	def edit
		@ama = Ama.find(params[:id])
	end

	def update
		@ama = Ama.find(params[:id])
		@ama.update_attributes params[:ama] if !@ama.approved
		if request.xhr?
		  render nothing: true and return
		else
		  redirect_to root_path
		end
	end

	def index
		@amas = Ama.date_grouped_amas(params[:category])
		render partial: "index"	 
	end

	def recommend
		if current_mentor
			@ama = Ama.find(params[:id])
			@ama.recommend_by current_user
		end
		render nothing: true
	end

	def destroy
		@ama = Ama.find(params[:id])
		@ama.destroy
		redirect_to root_path
	end

end
