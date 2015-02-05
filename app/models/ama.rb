class Ama < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	attr_accessible(:mentor_code, :mentor_url, :category, :user_id, :start_time,
	 :question_count, :like_count, :answer_count, :desc, :one_liner, :description, :background)
	after_create :generate_mentor_url


	def self.date_grouped_amas category
		amas = (category == "all") ? Ama.all : where(category: category)
		grouped = amas.where('start_time < (?)', Time.now + 24.hours).order(:start_time).reverse.group_by do |ama| 
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

	def generate_mentor_url
		code = generate_code
		update_attributes mentor_url: "/amas/#{id}?code=#{code}", mentor_code: code
	end

	def generate_code
		random = (48..122).map {|x| x.chr}
		characters = (random - random[43..48] - random[10..16])
		code = characters.map {|c| characters.sample}
		code.join[0..15]
	end
end