class User < ActiveRecord::Base
	def self.search(query)
	  where("email like ?", "%#{query}%") 
	end

	def self.create_with_omniauth(auth)
	  	create! do |user|
		    user.provider = auth.provider
		    user.uid = auth.uid
		    user.name = auth.info.name
		    user.nickname = auth.info.nickname
		   	user.access_token = auth.credentials.token
		end
	end

	def self.find_by_provider_and_uid(provider, uid)
	  where(provider: provider, uid: uid).first
	end
end
