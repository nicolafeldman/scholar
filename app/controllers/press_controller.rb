class PressController < ApplicationController

	def show
		@press = Press.find(1)
	end

end
