class QuotationsController < ApplicationController
	before_action :signed_in_user

	def index
		@quotations = Quotation.all
		@quotation = Quotation.new
	end

	def create
		@quotation = Quotation.new(quotation_params)
  		if @quotation.save
  			flash[:success] = "You have added a new quotation"
  			redirect_to quotations_path
  		else
  			render 'show'
  		end
	end

	def destroy
		Quotation.find(params[:id]).destroy
    	flash[:success] = "Quotation deleted."
    	redirect_to quotations_url
	end

	private

		def quotation_params
  			params.require(:quotation).permit(:quote, :attribution)
  		end

  		def signed_in_user
      		unless signed_in?
        		store_location
        		redirect_to signin_url, notice: "Please sign in."
     		end
    	end


end
