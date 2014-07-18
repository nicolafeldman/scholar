class PressController < ApplicationController
	before_action :signed_in_user,   only: [:edit, :update]

	def show
		@press = Press.find(1)
		@link = @press.links.build if signed_in?
		quotes = {'Wow!' => 'A SCHOLAR student', 'Scholar is great' => 'A SCHOLAR RA'}
    	@quote = quotes.keys.sample
    	@attribution = quotes[@quote]
	end

	def edit
	end

	def update
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
  			params.require(:press).permit(:text)
  		end

      def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end
