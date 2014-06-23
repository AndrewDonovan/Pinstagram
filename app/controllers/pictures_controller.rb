class PicturesController < ApplicationController

  respond_to :json, :html

  def index
  	@pictures = current_user.pictures.all
  	respond_with @pictures
  end


  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user = current_user

    if @picture.save
      respond_to do |format|
        format.html { redirect_to pictures_path }
        format.json { render json: @picture, status: :created }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  	@pictures = current_user.pictures.all
  	respond_with @pictures
  end


  def picture_params
    params.require(:picture).permit(:url)
  end
end
