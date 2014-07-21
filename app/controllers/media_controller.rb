class MediaController < ApplicationController
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

  private

  	def medium_params
  		params.require(:medium).permit(:name, :description,
  			photos_attributes: [:image, :description])
  	end
end
