class StudiesController < ApplicationController
	before_action :signed_in_user,   only: [:edit, :update]

	def show
		@study = Study.find(1)
	end

  def edit
    @study = Study.find(params[:id])
  end

  def update
  @study = Study.find(params[:id])

    if @study.update_attributes(study_params)

      if params[:images]
        @study.pictures.destroy_all
        params[:images].each { |image|
          @study.pictures.create(image: image)
        }
      end

      flash[:success] = 'Page updated!'
      redirect_to study_path(1)
      
    else
      flash.now[:error] = 'Page was not updated, try again'
      render 'edit'
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
