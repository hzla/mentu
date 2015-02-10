module ApplicationHelper
	def add_breaks(s)
	  s.gsub(/\n/, '<br>')
	end

	def current_avatar
		if current_user
			current_user.avatar_url
		else
			"missing.png"
		end
	end

	def current_admin
		current_user && current_user.role == "admin"
	end

	def current_mentor
		current_user && current_user.role == "mentor"
	end
end
