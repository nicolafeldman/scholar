class StudiesController < ApplicationController
	before_action :signed_in_user,   only: [:new, :create]

	def show
		@study = Study.last
	end

	def new
		@study = Study.new
	end

	def create
	@study = Study.new(study_params)

    if @study.save

      if params[:images]
        params[:images].each { |image|
          @study.pictures.create(image: image)
        }
      end

      flash[:success] = 'Page updated!'
      redirect_to @study
      
    else
      flash.now[:error] = 'Update failed'
      render 'new'
    end
	end

	private

		def signed_in_user
      		unless signed_in?
        		store_location
        		redirect_to signin_url, notice: "Please sign in."
      		end
    	end

    	def study_params
    		params.require(:study).permit(:text, pictures_attributes: 
    			[:image, :description])
    	end
end
