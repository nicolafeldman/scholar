class DonatesController < ApplicationController
	before_action :signed_in_user,   only: [:edit_full, :update_full,
   :edit, :update, :destroy]

	def show
		@donate = Donate.find(1)
	end

	def edit_full
    @donate = Donate.find(1)
  end

  def update_full
  @donate = Donate.find(1)

    if @donate.update_attributes(donate_params)

      if params[:images]
        @donate.pictures.destroy_all
        params[:images].each { |image|
          @donate.pictures.create(image: image)
        }
      end

      flash[:success] = 'Page updated!'
      redirect_to donate_path(1)
      
    else
      flash.now[:error] = 'Page was not updated, try again'
      render 'edit'
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
