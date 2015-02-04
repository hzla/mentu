class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :ama
	has_ancestry
	attr_accessible :score, :user_id, :ama_id, :body, :comment_type, :parent, :parent_id, :voter_list

	def timestamp
		elapsed_time_in_minutes = (Time.now - created_at) / 60
		if elapsed_time_in_minutes < 60
			if elapsed_time_in_minutes.floor < 60
				"#{elapsed_time_in_minutes.floor} minutes ago by #{user.name}"
			elsif elapsed_time_in_minutes < 1440
				elapsed_time_in_hours = (elapsed_time_in_minutes / 60).floor
				"#{elapsed_time_in_hours} hours ago by #{user.name}"
			else
				"#{created_at.strftime("%b %-d")} by #{user.name}"
			end
		end
	end

	def attempt_upvote_from user #test
		if voter_list == nil
			update_attributes voter_list: [user.id], score: 1
		else 
			if voter_list.include? user.id
				return
			else
				new_list = voter_list << user.id
				new_score = score + 1
				update_attributes voter_list: new_list, score: new_score
			end
		end
	end
end