class HomeController < ApplicationController

  before_action :get_user_id

  def index
  		if params[:query] 
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
   	    # @rangers = Instagram.user_recent_media("15703955", {:count => 5})
   	    # @tags2 = Instagram.tag_recent_media('nyrangers', {:count => 5, :client_id => ENV['INSTAAPI_CLIENT_ID']})
  end

  private

  def get_user_id
      @user = current_user
  end

end