class User < ActiveRecord::Base
include Clearance::User

	has_many :authorizations
	has_many :amas
	has_many :comments
	has_many :codes
	has_attached_file :document
	has_attached_file :avatar
	validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	attr_accessible(:one_liner, :background, :avatar, :password, :document, :role, :essay,
	:name, :email, :profile_pic_url, :school, :dream_school, :timezone,
	:major, :app_response, :video_url, :twitter, :weibo, :facebook, :wechat, :github, :follow_me, :link_click_count)

	after_update :notify_mentorship

	def self.create_with_facebook auth_hash
		timezone = auth_hash.extra.raw_info.timezone
		profile = auth_hash['info']
		fb_token = auth_hash.credentials.token
		user = User.new name: profile["name"], profile_pic_url: profile["image"], timezone: timezone, email: profile["email"], password: rand(1213920)
    user.authorizations.build :uid => auth_hash["uid"]
    binding.pry
    user if user.save
	end

	def is_mentor
		role == "mentor" || role == "admin"
	end

	def avatar_url
		if avatar.blank?
			'profileplaceholder.svg'
		else
			# avatar.url.gsub("s3.", "s3-ap-northeast-1.")
			'profileplaceholder.svg'
		end
	end

	def question_count
		!amas.empty? ? amas.pluck(:question_count).reduce(:+) : 0
	end

	def answer_count
		!amas.empty? ? amas.pluck(:answer_count).reduce(:+) : 0
	end

	def like_count
		!amas.empty? ? amas.pluck(:like_count).reduce(:+) : 0
	end

	def date_ordered_amas
		amas.where(show: true).order(:start_time).reverse
	end

	def activated?
		codes.count > 0
		#UNCOMMENT THE LINE BELOW THIS TO TURN OFF THE CODE REQUIREMENT
		#true
	end

	def self.notify_all
		all.each do |user|
			UserMailer.daily_ama(user).deliver
		end
	end

	private

	def notify_mentorship
		if role_changed? && role == "mentor"
			UserMailer.mentor_promotion(self).deliver
		end
	end


end
