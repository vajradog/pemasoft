module ApplicationHelper



	def avatar_url(user)
		if user.avatar_url.present?
			user.avatar_url
		else
			default_url = "http://s14.postimg.org/qn8vazhlt/guest.png"
			gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
			"http://gravatar.com/avatar/#{gravatar_id}.png?s=200&d=#{CGI.escape(default_url)}"
		end
	end
end
