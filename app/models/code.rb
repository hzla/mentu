class Code < ActiveRecord::Base
	belongs_to :user
	attr_accessible :body, :user_id

	after_create :generate_body

	def generate_body
		update_attributes body: generate_code
	end

	def generate_code
		characters = (97..122).map {|x| x.chr}
		code = characters.map {|c| characters.sample}
		code.join[0..9].upcase
	end

end