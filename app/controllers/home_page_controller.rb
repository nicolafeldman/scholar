class HomePageController < ApplicationController

	def show
	end

	def edit
		@home_page = HomePage.first
	end

	def update
		@home_page = HomePage.first
			@home_page.attachments.create(:photo=> params[:photo])
		
	end

	def upload
		@uploaded_io = params[:picture]
  		File.open(Rails.root.join('public', 'uploads', @uploaded_io.original_filename), 'wb') do |file|
    		file.write(@uploaded_io.read)
  		end
		# redirect_to 'show'
	end
	
end
