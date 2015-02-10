require 'spec_helper'

describe User do 
	
	[:amas, :comments].each do |model| 
		it {should have_many model }
	end

	before :all do 
		@user = create :user
	end	



end