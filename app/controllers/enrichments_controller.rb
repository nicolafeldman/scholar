class EnrichmentsController < ApplicationController
  before_action :signed_in_user,   only: [:new, :create]

	def show
		@enrichment = Enrichment.last
	end

	def new
		@enrichment = Enrichment.new
	end

	def create
	@enrichment = Enrichment.new(enrichment_params)

    if @enrichment.save

      if params[:images]
        #===== The magic is here ;)
        params[:images].each { |image|
          @enrichment.pictures.create(image: image)
        }
      end

      flash[:success] = 'Photos successfully updated!'
      redirect_to @enrichment
      
    else
      flash.now[:error] = 'Gallery was not created, try again'
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

    	def enrichment_params
    		params.require(:enrichment).permit(:text, pictures_attributes: 
    			[:image, :description])
    	end
end
