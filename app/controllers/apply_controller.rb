class ApplyController < ApplicationController

	before_action :signed_in_user,   only: [:edit, :update, :edittext, 
    :update_text]

	def show
	@apply = Apply.find(1)
	end

	def update
		@apply = Apply.find(1)
  		if @apply.update_attributes(apply_params)
  			flash.now[:success] = "Application updated"
  			render 'show'
  		else
  			flash.now[:error] = "Upload failed, try again"
  			render 'show'
  		end
  	end

  def edit
		@apply = Apply.find(params[:id])
  end

  def create
  end

  def destroy
  	@apply = Apply.find(1)
  	if @apply.update_attributes(application: nil)
      flash.now[:success] = "Application deleted"	
  		render 'show'
  	else
  		render 'show'
  	end
  end

  def edittext
  end

  def update_text
    @apply = Apply.find(1)
    @apply.update_attributes(text_before: params[:text_before], 
      text_after: params[:text_after], link_text: params[:link_text],
      url: params[:url])
    render 'show'
  end


  	private

  		def apply_params
  			params.require(:apply).permit(:text_before, :text_after, :link_text, :url, :application)
  		end

      def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
