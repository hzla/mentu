class User < ActiveRecord::Base

	attr_accessible :name, :email, :profile_pic_url

	def self.create_with_facebook auth_hash
		timezone = auth_hash.extra.raw_info.timezone
		profile = auth_hash['info']
		fb_token = auth_hash.credentials.token
		binding.pry
		#user = User.new 
		#code for setting up user
    user.authorizations.build :uid => auth_hash["uid"]
    user if user.save
	end
end

