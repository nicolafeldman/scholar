class MediaController < ApplicationController
  before_action :signed_in_user,   only: [:new, :create, :destroy, 
    :editvideo, :update_video]

  def index
    @media = Medium.all
  end

  def show
  	@medium = Medium.find(params[:id])
  end

  def create
  @medium = Medium.new(medium_params)

    if @medium.save

      if params[:images]
        #===== The magic is here ;)
        params[:images].each { |image|
          @medium.pictures.create(image: image)
        }
      end

      flash[:success] = 'Gallery successfully created!'
      redirect_to @medium
      
    else
      flash.now[:error] = 'Gallery was not created, try again'
      render 'new'
    end

  end

  def new
  	@medium = Medium.new
  end

  def destroy
    Medium.find(params[:id]).destroy
    flash[:success] = "Gallery deleted."
    redirect_to media_url
  end

  def editvideo
  end

  def update_video
    @medium = Medium.find(params[:id])
    @medium.update_attributes!(video1: params[:video1], video2: params[:video2])
    render 'show'
  end

  private

  	def medium_params
  		params.require(:medium).permit(:video1, :video2, :name, :description,
  			photos_attributes: [:image, :description])
  	end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
