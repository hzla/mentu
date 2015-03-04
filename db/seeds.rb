
time = Time.now - 5.days
user_id = User.last.id
categories = ["all", "biz", "sci", "art", "inv", "ent", "fin"]




10.times do 
	3.times do 
		ama = Ama.create(user_id: user_id, start_time: time, category: categories.sample, 
		one_liner: "I am in my second year at Stanford Law, and will be joining Cooley LLp this summer.",
		description: "My name is Rosa Zhou. Debating is my passion. I love dogs and want to become UN Secretary General some day. As me anything.")
		3.times do 
			question = Comment.create user_id: user_id, ama_id: ama.id, body: Faker::Lorem.paragraph, comment_type: "question" 
			reply = Comment.create user_id: user_id, ama_id: ama.id, body: Faker::Lorem.paragraph, parent_id: question.id, comment_type: "reply"
			Comment.create user_id: user_id, ama_id: ama.id, body: Faker::Lorem.paragraph, parent_id: reply.id, comment_type: "comment"
		end
	end

	time += 1.day
end

