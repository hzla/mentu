module ApplicationHelper
	def add_breaks(s)
	  s.gsub(/\n/, '<br>')
	end
end
