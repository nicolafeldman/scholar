class HomePageController < ApplicationController

	before_action :signed_in_user,   only: [:edit, :update]

	def show
		@home_page = HomePage.first
	end

	def edit
		@home_page = HomePage.first
		@picture = @home_page.pictures.build
	end

	def update
		@home_page = HomePage.first

		if params[:picture]
			#===== The magic is here ;)
			params[:home_page][:picture].each { |picture|
				@home_page.pictures.create(image: params[:home_page][:picture])
			}
		end
		redirect_to home_page_path(1)

		# if @home_page.update_attributes(home_page_params)
		# 	flash[:success] = "New photo uploaded"
		# 	redirect_to home_page_path(1)
		# else
		# 	render 'edit'
		# end
	end


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
