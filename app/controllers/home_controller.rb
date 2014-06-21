class HomeController < ApplicationController
  before_action :get_user_id
  def index
  		if params[:keyword]
        # search user names to show their recent media
  			@user_name2 = Home.idFind(params[:keyword])
  		end
  	  if params[:hashword]
        # seach has tags
		    @tags = Instagram.tag_recent_media((params[:hashword]), {:count => 15, :client_id => ENV['INSTAAPI_CLIENT_ID']})
   	  end
      if current_user
        # this is the actual logged in users news feed of who they are following
        @feed = Instagram.user_media_feed(:access_token => current_user.access_token, :count => 15, :client_id => ENV['INSTAAPI_CLIENT_ID'])
      end
# below is the code that inputs the above feeds or search inputs into the javascript controllers
      @feedurls = []
      if @current_user.present?
        @feed.each do |feed|
          @feedurls.push(feed.images.standard_resolution.url)
            end
      end

      @usearch = []
      if @user_name2.present?
          @user_name2.each do |u|
            @usearch.push(u.images.standard_resolution.url)
          end
      end

      @utags = []
      if @tags.present?
        @tags.each do |u|
          @utags.push(u.images.standard_resolution.url)
            end
      end
  end

  private

  def get_user_id
      @user = current_user
  end
end 


