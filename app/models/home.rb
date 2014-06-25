class Home < ActiveRecord::Base
	def self.idFind(query)
		user = Instagram.user_search(query)[0].id
		Instagram.user_recent_media(user, {:count => 15})
	end

	def self.nameFind(query)
		Instagram.user_search(query)[0].username
	end
end