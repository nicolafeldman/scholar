class PressController < ApplicationController
	before_action :signed_in_user,   only: [:edit, :update]

	def show
		@press = Press.find(1)
		@link = @press.links.build if signed_in?

	end

	def edit
	end

	def update
    @link = Press.find(1).links.build if signed_in?
      @press = Press.find(1)
      if @press.update_attributes(press_params)
        flash.now[:success] = "Page updated"
        render 'show'
      else
        flash.now[:error] = "Update failed, try again"
        render 'show'
      end
	end

	private

		def press_params
  			params.permit(:text)
  		end

      def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end
