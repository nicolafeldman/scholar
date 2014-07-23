class DonatesController < ApplicationController
	before_action :signed_in_user,   only: [:new, :create]

	def show
		@donate = Donate.last
	end

	def new
		@donate = Donate.new
	end

	def create
	@donate = Donate.new(donate_params)

    if @donate.save

      if params[:images]
        params[:images].each { |image|
          @donate.pictures.create(image: image)
        }
      end

      flash[:success] = 'Page updated'
      redirect_to @donate
      
    else
      flash.now[:error] = 'Something went wrong'
      render 'new'
    end
	end

	def edit
		@donate = Donate.find(params[:id])
  	end

	def update
		@donate = Donate.find(params[:id])
  		if @donate.update_attributes(donate_params)
  			flash.now[:success] = "Brochure updated"
  			render 'show'
  		else
  			flash.now[:error] = "Upload failed, try again"
  			render 'edit'
  		end
  	end

  	def destroy
  		@donate = Donate.find(params[:id])
  		if @donate.update_attributes(brochure: nil)
      		flash.now[:success] = "Brochure deleted"	
  			render 'show'
  		else
  			render 'show'
  		end
  	end

	private

		def signed_in_user
      		unless signed_in?
        		store_location
        		redirect_to signin_url, notice: "Please sign in."
      		end
    	end

    	def donate_params
    		params.require(:donate).permit(:text, :brochure, 
    			pictures_attributes: [:image, :description])
    	end
end
