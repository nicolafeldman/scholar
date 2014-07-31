class HomePagesController < ApplicationController

	before_action :signed_in_user,   only: [:edit, :update]

	def show
		@home_page = HomePage.find(1)
	end

  def edit
    @home_page = HomePage.find(params[:id])
  end

  def update
  @home_page = HomePage.find(params[:id])

    if @home_page.update_attributes(home_page_params)

      if params[:images]
        @home_page.pictures.destroy_all
        params[:images].each { |image|
          @home_page.pictures.create(image: image)
        }
      end

      flash[:success] = 'Photos updated!'
      redirect_to root_url
      
    else
      flash.now[:error] = 'Photos were not updated, try again'
      render 'edit'
    end
  end

  # def create
  # @home_page = HomePage.new(home_page_params)

  #   if @home_page.save

  #     if params[:images]
  #       #===== The magic is here ;)
  #       params[:images].each { |image|
  #         @home_page.pictures.create(image: image)
  #       }
  #     end

  #     flash[:success] = 'Photos successfully updated!'
  #     redirect_to root_url
      
  #   else
  #     flash.now[:error] = 'Gallery was not created, try again'
  #     render 'new'
  #   end

  # end

  # def new
  # 	@home_page = HomePage.new
  # end

  # def destroy
  #   Medium.find(params[:id]).destroy
  #   flash[:success] = "Gallery deleted."
  #   redirect_to media_url
  # end


	private

		def signed_in_user
      		unless signed_in?
        		store_location
        		redirect_to signin_url, notice: "Please sign in."
      		end
    	end

    	def home_page_params
    		params.permit(pictures_attributes: 
    			[:image, :description])
    	end
	
end
