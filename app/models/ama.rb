class Ama < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	attr_accessible :category, :user_id, :start_time, :question_count, :like_count, :answer_count, :desc

	def self.date_grouped_amas category
		amas = (category == "all") ? Ama.all : where(category: category)
		grouped = amas.order(:start_time).group_by do |ama| 
			time = ama.start_time.strftime("%B %-d") 
			if ama.start_time.strftime("%B %-d") == Time.now.strftime("%B %-d")
				time = "Today"
			end	
			time
		end
		grouped
	end 

	def questions
		comments.where(comment_type: "question").order('score desc')
	end
end