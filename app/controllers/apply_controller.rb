class ApplyController < ApplicationController

	before_action :signed_in_user,   only: [:edit, :update]

	def show
	@apply = Apply.find(1)
	quotes = {'Wow!' => 'A SCHOLAR student', 'Scholar is great' => 'A SCHOLAR RA'}
  @quote = quotes.keys.sample
  @attribution = quotes[@quote]
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
  		render 'show'
  	else
  		render 'show'
  	end
  end

  def edittext
  end

  def update_text
    @apply = Apply.find(1)
    @apply.update_attributes!(text: params[:text])
    render 'show'
  end


  	private

  		def apply_params
  			params.require(:apply).permit(:text, :application)
  		end

      def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
