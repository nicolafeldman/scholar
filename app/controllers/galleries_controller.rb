class GalleriesController < ApplicationController
	before_action :signed_in_user,   only: [:new, :create, :destroy]

  def create
  @gallery = Gallery.new(gallery_params)

    if @gallery.save

      if params[:images]
        #===== The magic is here ;)
        params[:images].each { |image|
          @gallery.pictures.create(image: image)
        }
      end

      flash[:success] = 'Gallery successfully created!'
      redirect_to contact_path(1)
      
    else
      flash.now[:error] = 'Gallery was not created, try again'
      render 'new'
    end

  end

  def new
  	@gallery = Gallery.new
  end

  # def destroy
  #   Gallery.find(params[:id]).destroy
  #   flash[:success] = "Gallery deleted."
  #   redirect_to media_url
  # end

  private

  	def gallery_params
  		params.permit(photos_attributes: [:image, :description])
  	end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
