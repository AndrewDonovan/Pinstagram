class MediaContentsController < ApplicationController
  def create
    @media = Media.new(media_file_name: params[:file])
    if @media.save!
	  respond_to do |format|
	    format.json{ render :json => @media }
	  end
    end
  end
end