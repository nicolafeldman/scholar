class LinksController < ApplicationController
	before_action :signed_in_user

	def create
		@link = Press.find(1).links.build(link_params)
    		if @link.save
      		flash[:success] = "Link created"
      		redirect_to press_path(1)
    	else
      		render 'static_pages/home'
    	end
	end

	def destroy
		@link = Press.find(1).links.find(params[:id])
		@link.destroy
		redirect_to press_path(1)
	end

	private

		def link_params
      		params.require(:link).permit(:text_before, :text_after,
      			:link_text, :url)
    	end

    	def signed_in_user
      		unless signed_in?
        		store_location
        		redirect_to signin_url, notice: "Please sign in."
      		end
    	end
end
