class HistoriesController < ApplicationController
	before_action :signed_in_user,   only: [:edit, :update, :edittext, 
    :update_text, :create, :destroy]

	def show
		@history = History.find(1)
	end

	def update
		@history = History.find(1)
  		if @history.update_attributes(history_params)
  			flash.now[:success] = "Photo updated"
  			render 'show'
  		else
  			flash.now[:error] = "Upload failed, try again"
  			render 'show'
  		end
  	end

  def edit
		@history = History.find(params[:id])
  end

  def create
  end

  def destroy
  	@history = History.find(1)
  	if @history.update_attributes(history_photo: nil)
      flash.now[:success] = "Photo deleted"	
  		render 'show'
  	else
  		render 'show'
  	end
  end

  def edittext
  end

  def update_text
    @history = History.find(1)
    @history.update_attributes(text: params[:text])
    render 'show'
  end


  	private

  		def history_params
  			params.require(:history).permit(:text, :history_photo)
  		end

      def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
