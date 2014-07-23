class StaffsController < ApplicationController
	before_action :signed_in_user,   only: [:new, :create, :destroy]

	def index
		@staffs = Staff.all
	end

  def create
  @staff = Staff.new(staff_params)

    if @staff.save

      if params[:images]
        params[:images].each { |image|
          @staff.pictures.create(image: image)
        }
      end

      flash[:success] = 'Staff entry added!'
      redirect_to staffs_url
      
    else
      flash.now[:error] = 'Update failed'
      render 'new'
    end

  end

  def new
  	@staff = Staff.new
  end

  def destroy
    Staff.find(params[:id]).destroy
    flash[:success] = "Staff entry deleted."
    redirect_to staffs_url
  end

	private

		def signed_in_user
      		unless signed_in?
        		store_location
        		redirect_to signin_url, notice: "Please sign in."
      		end
    	end

    	def staff_params
    		params.require(:staff).permit(:text, pictures_attributes: 
    			[:image, :description])
    	end
end
