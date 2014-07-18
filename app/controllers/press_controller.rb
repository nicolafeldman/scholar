class PressController < ApplicationController

	def show
		@press = Press.find(1)
		@link = @press.links.build if signed_in?
		quotes = {'Wow!' => 'A SCHOLAR student', 'Scholar is great' => 'A SCHOLAR RA'}
    	@quote = quotes.keys.sample
    	@attribution = quotes[@quote]
	end

end
