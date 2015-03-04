class Code < ActiveRecord::Base
	belongs_to :user
	attr_accessible :body, :user_id

	after_create :generate_body

	def generate_body
		update_attributes body: generate_code
	end

	def generate_code
		random = (48..122).map {|x| x.chr}
		characters = (random - random[43..48] - random[10..16])
		code = characters.map {|c| characters.sample}
		code.join[0..15]
	end

end