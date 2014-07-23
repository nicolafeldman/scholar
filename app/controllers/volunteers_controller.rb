class VolunteersController < ApplicationController
	before_action :signed_in_user,   only: [:new, :create]

	def show
		@volunteer = Volunteer.last
	end

	def new
		@volunteer = Volunteer.new
	end

	def create
	@volunteer = Volunteer.new(volunteer_params)

    if @volunteer.save

      if params[:images]
        params[:images].each { |image|
          @volunteer.pictures.create(image: image)
        }
      end

      flash[:success] = 'Page updated!'
      redirect_to @volunteer
      
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

    	def volunteer_params
    		params.require(:volunteer).permit(:text, pictures_attributes: 
    			[:image, :description])
    	end
end
