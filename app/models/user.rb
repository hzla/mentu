class User < ActiveRecord::Base
	has_many :authorizations

	attr_accessible :role, :essay, :name, :email, :profile_pic_url, :school, :dream_school, :timezone, :major, :app_response, :video_url

	def self.create_with_facebook auth_hash
		timezone = auth_hash.extra.raw_info.timezone
		profile = auth_hash['info']
		fb_token = auth_hash.credentials.token
		user = User.new name: profile["name"], profile_pic_url: profile["image"], timezone: timezone 
    user.authorizations.build :uid => auth_hash["uid"]
    user if user.save
	end

	def has_filled_out_basic_info
		(email.to_s != "" && dream_school.to_s != "" && major.to_s != "") || (email.to_s != "" && app_response.to_s != "")
	end
end

