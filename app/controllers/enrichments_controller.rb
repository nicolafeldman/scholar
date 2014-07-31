class EnrichmentsController < ApplicationController
  before_action :signed_in_user,   only: [:edit, :update]
  #only: [:new, :create]

	def show
		@enrichment = Enrichment.find(1)
	end

  def edit
    @enrichment = Enrichment.find(params[:id])
  end

  def update
  @enrichment = Enrichment.find(params[:id])

    if @enrichment.update_attributes(enrichment_params)

      if params[:images]
        @enrichment.pictures.destroy_all
        params[:images].each { |image|
          @enrichment.pictures.create(image: image)
        }
      end

      flash[:success] = 'Page successfully updated!'
      redirect_to @enrichment
      
    else
      flash.now[:error] = 'Page was not updated, try again'
      render 'edit'
    end
  end

  # def new
  #   #@enrichment = Enrichment.new
  # end

	# def create
	# @enrichment = Enrichment.new(enrichment_params)

 #    if @enrichment.save

 #      if params[:images]
 #        #===== The magic is here ;)
 #        params[:images].each { |image|
 #          @enrichment.pictures.create(image: image)
 #        }
 #      end

 #      flash[:success] = 'Photos successfully updated!'
 #      redirect_to @enrichment
      
 #    else
 #      flash.now[:error] = 'Gallery was not created, try again'
 #      render 'new'
 #    end
	# end

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
