
time = Time.now - 5.days
user_id = User.last.id
categories = ["all", "biz", "sci", "art", "inv", "ent", "fin"]




10.times do 
	3.times do 
		ama = Ama.create user_id: user_id, start_time: time, category: categories.sample
		3.times do 
			question = Comment.create user_id: user_id, ama_id: ama.id, body: Faker::Lorem.paragraph, comment_type: "question" 
			reply = Comment.create user_id: user_id, ama_id: ama.id, body: Faker::Lorem.paragraph, parent_id: question.id, comment_type: "reply"
			Comment.create user_id: user_id, ama_id: ama.id, body: Faker::Lorem.paragraph, parent_id: reply.id, comment_type: "comment"
		end
	end

	time += 1.day
end

