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
  	# @pictures = current_user.pictures.all
  	# respond_with @pictures
    @picture = Picture.find(params[:id])
  	respond_with @pictures
  end

  def destroy
  	Picture.destroy params[:id]
  	redirect_to pictures_path
    # @picture = Picture.find(params[:id])
    # @picture.destroy
    #   respond_to do |format|
    #     format.html { redirect_to :root }
    #     format.json { render json: {head: :ok} }
    #   end
  end


  def picture_params
    params.require(:picture).permit(:url)
  end
end
