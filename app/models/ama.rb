class Ama < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	attr_accessible(:approved, :checking_approval, :mentor_code, :mentor_url, :category, :user_id, :start_time,
	 :question_count, :like_count, :answer_count, :desc, :one_liner, :description, :background, :show,
	 :background_url)
	after_create :generate_mentor_url
	after_update :send_notification_after_review


	def self.date_grouped_amas category
		amas = (category == "all") ? Ama.all : where(category: category)
		grouped = amas.where(show: true).where('start_time < (?)', Time.now + 24.hours).order(:start_time).reverse.group_by do |ama| 
			time = ama.start_time.strftime("%B %-d") 
			if ama.start_time.strftime("%B %-d") == Time.now.strftime("%B %-d")
				time = "Today"
			end	
			time
		end
		grouped
	end 

	def self.current
		where(show: true).select do |ama|
			ama.start_time.day == Time.now.day
		end[0..2]
	end
	def question_count
		comments.where(comment_type: "question").count
	end

	def answer_count
		comments.where(comment_type: "reply").count
	end

	def heat
		comments.pluck(:score).reduce(:+)
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

	private

	def send_notification_after_review
		if approved_changed? && approved
			UserMailer.ama_approval(user, self).deliver
		end 
		if show_changed? && show
			UserMailer.ama_publishing(user, self).deliver
		end
	end

end