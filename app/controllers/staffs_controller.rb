class StaffsController < ApplicationController
	before_action :signed_in_user,   only: [:new, :create, :destroy, :edit, 
    :update]

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

  def edit
    @staff = Staff.find(params[:id])
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.update_attributes(staff_params)
      if params[:images]
        @staff.pictures.create(image: params[:images].last)
        @staff.pictures.first.destroy
      end
      flash[:success] = "Staff entry updated"
      redirect_to staffs_url
    else
      render 'edit'
    end
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
