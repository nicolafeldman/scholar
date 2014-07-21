class ContactController < ApplicationController
  before_action :signed_in_user,   only: [:edit, :update]

	def show
		@contact = Contact.find(1)
	end

	def update
		@contact = Contact.find(1)
  		if @contact.update_attributes(contact_params)
  			flash[:success] = "Page updated"
  			redirect_to contact_path(1)
  		else
  			render 'edit'
  		end
  	end

  	def edit
  		@contact = Contact.find(params[:id])
  	end

  	def create
  	end

  	private

  		def contact_params
  			params.require(:contact).permit(:text)
  		end

      def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end
