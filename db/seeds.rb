
time = Time.now - 5.days
user_id = User.last.id
categories = ["all", "biz", "sci", "art", "inv", "ent", "fin"]




10.times do
	3.times do
		ama = Ama.create(user_id: user_id, start_time: time, show: true, category: categories.sample,
		one_liner: "我在斯坦福大学念法律专业，目前大二，准备这个暑假加入Cooley LLP
。",
		description: "我是Rosa Zhou.我热爱辩论，我喜欢狗狗，希望有一天能成为联合国安理会的秘书。欢迎来问我任何事！")
		3.times do
			question = Comment.create user_id: user_id, ama_id: ama.id, body: Faker::Lorem.paragraph, comment_type: "question"
			reply = Comment.create user_id: user_id, ama_id: ama.id, body: Faker::Lorem.paragraph, parent_id: question.id, comment_type: "reply"
			Comment.create user_id: user_id, ama_id: ama.id, body: Faker::Lorem.paragraph, parent_id: reply.id, comment_type: "comment"
		end
	end

	time += 1.day
end

