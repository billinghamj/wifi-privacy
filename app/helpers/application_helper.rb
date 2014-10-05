module ApplicationHelper
	def render_mac(mac)
		mac.scan(/.{2}/).join(':')
	end
end
