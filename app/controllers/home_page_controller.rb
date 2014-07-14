class HomePageController < ApplicationController

	def show
	end

	def edit
	end

	def update
	end

	def upload
		@uploaded_io = params[:picture]
  		File.open(Rails.root.join('public', 'uploads', @uploaded_io.original_filename), 'wb') do |file|
    		file.write(@uploaded_io.read)
  		end
		# redirect_to 'show'
	end
	
end
