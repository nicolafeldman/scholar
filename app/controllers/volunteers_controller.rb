class VolunteersController < ApplicationController
	before_action :signed_in_user,   only: [:edit, :update]

	def show
		@volunteer = Volunteer.find(1)
	end

	def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update
  @volunteer = Volunteer.find(params[:id])

    if @volunteer.update_attributes(volunteer_params)

      if params[:images]
        @volunteer.pictures.destroy_all
        params[:images].each { |image|
          @volunteer.pictures.create(image: image)
        }
      end

      flash[:success] = 'Page updated!'
      redirect_to volunteer_path(1)
      
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

    	def volunteer_params
    		params.require(:volunteer).permit(:text, pictures_attributes: 
    			[:image, :description])
    	end
end
