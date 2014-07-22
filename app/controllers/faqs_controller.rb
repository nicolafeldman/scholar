class FaqsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :destroy]

	def index
		@faqs = Faq.all
	end

	def new
		@faq = Faq.new
	end

	def create
		@faq = Faq.new(faq_params)
  		if @faq.save
  			flash[:success] = "You have added a new FAQ"
  			redirect_to faqs_path
  		else
  			render 'new'
  		end
	end

	def destroy
		Faq.find(params[:id]).destroy
    	flash[:success] = "FAQ deleted."
    	redirect_to faqs_url
	end

	private

	def faq_params
  		params.require(:faq).permit(:question, :answer)
  	end

  	def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end
