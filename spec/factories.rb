FactoryGirl.define do
	# factory :bounty do
	# 	sequence(:question) { |n| "question #{n}"}
	# 	sequence(:response_count) {|n| n}
	# 	product_id {1}
	# end

	# factory :bounty_comment, class: "Comment" do
	# 	association :commentable, factory: :bounty
	# 	sequence(:body) {|n| "text" * rand(100) + "#{n}"}
	# 	user_id {1}
	# 	commentable_id {1}
	# 	commentable_type {"Bounty"}
	# 	sequence(:rating) {|n| n * -1 + 1000 }
	# end

	factory :user do 
		name {"Andy Lee"}
		email {"andy.hzla@yahoo.com"}
		school {"Boston College"}
		password {"password"}
	end

	factory :comment do 
		body {"asdfasdfasdfasdf"}
		score {0}
		user_id {1}
		ama_id {1}
	end

	
end