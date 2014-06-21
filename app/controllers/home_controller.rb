class HomeController < ApplicationController
  before_action :get_user_id
  def index
  		if params[:query] 
        user = Instagram.user_search(params[:query])[0].id
        puts "XXXXXXXXXXX"
        puts user
        puts Instagram.user_recent_media(user, {:count => 15})

  			@user_name = Home.idFind(params[:query])
  			@user_name_Name = Home.nameFind(params[:query])
  		end
  		if params[:keyword] 
  			@user_name2 = Home.idFind(params[:keyword])
  			@user_name_Name2 = Home.nameFind(params[:keyword])
  		end
  	    @instagram = Instagram.user_recent_media("12278927", {:count => 15})
  	  if params[:hashword]
		    @tags = Instagram.tag_recent_media((params[:hashword]), {:count => 15, :client_id => ENV['INSTAAPI_CLIENT_ID']})
   	  end
  	  if params[:hashword2]
		    @tags2 = Instagram.tag_recent_media((params[:hashword2]), {:count => 15, :client_id => ENV['INSTAAPI_CLIENT_ID']})
   	  end
      if current_user
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


