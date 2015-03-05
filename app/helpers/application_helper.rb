module ApplicationHelper
	def add_breaks(s)
	  s.gsub(/\n/, '<br>')
	end

	def current_avatar
		if current_user
			current_user.avatar_url
		else
			"profileplaceholder.svg"
		end
	end

	def current_admin
		current_user && current_user.role == "admin"
	end

	def current_mentor
		current_user && current_user.role == "mentor" || current_user && current_user.role == "admin"
	end

	def badge user
		if user.is_mentor
			image_tag("badgementor.svg", :class => "badge")
		elsif user.is_beta
			image_tag("badgebeta.svg", :class => "badge")
		else
		end
	end
end
