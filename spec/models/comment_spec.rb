require 'spec_helper'

describe Comment do 
	
	[:ama, :user].each do |model| 
		it {should belong_to model }
	end

	before :all do 
		@comment = create :comment
		@user = create :user
	end	

	describe "upvoting" do 

		it "can be upvoted by a new user" do 
			@comment.attempt_upvote_from @user
			expect(@comment.score).to eq 1
			expect(@comment.voter_list).to eq [@user.id]
		end

		it "will reject an upvote from a user that has already upvoted" do 
			@comment.update_attributes voter_list: [@user.id], score: 1
			@comment.attempt_upvote_from @user
			expect(@comment.score).to eq 1
			expect(@comment.voter_list).to eq [@user.id]
		end


	end



end