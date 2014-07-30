class ResultsController < ApplicationController
	before_action :signed_in_user,   only: [:edit, :update, :edittext, 
    :update_text, :create, :destroy]

	def show
		@result = Result.find(1)
	end

	def update
		@result = Result.find(1)
  		if @result.update_attributes(result_params)
  			flash.now[:success] = "Photo updated"
  			render 'show'
  		else
  			flash.now[:error] = "Upload failed, try again"
  			render 'show'
  		end
  	end

  def edit
		@result = Result.find(params[:id])
  end

  def create
  end

  def destroy
  	@result = Result.find(1)
  	if @result.update_attributes(result_photo: nil)
      flash.now[:success] = "Photo deleted"	
  		render 'show'
  	else
  		render 'show'
  	end
  end

  def edittext
  end

  def update_text
    @result = Result.find(1)
    @result.update_attributes(text: params[:text])
    render 'show'
  end


  	private

  		def result_params
  			params.require(:result).permit(:text, :result_photo)
  		end

      def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
