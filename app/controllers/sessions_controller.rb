# class SessionsController < ApplicationController
#   def new
#   end

#   def create
#   auth = request.env['omniauth.auth']
#  	puts auth
#   # render :text => auth_hash.inspect
# end

#   def failure
#   end
# end
class SessionsController < ApplicationController
	after_action :allow_insta_iframe

	def new
	end

	def create
		auth = request.env["omniauth.auth"]
		puts auth
		user = User.find_by_provider_and_uid(auth.provider, auth.uid) || User.create_with_omniauth(auth)
		session[:user_id] = user.id
		redirect_to root_path, :notice => "Signed in!"
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, :notice => "Signed out!"
		#'http://instagram.com/accounts/logout'	
	end
	
private

  def allow_insta_iframe
    response.headers['X-Frame-Options'] = 'ALLOW-FROM http://instagram.com'
  end

end

