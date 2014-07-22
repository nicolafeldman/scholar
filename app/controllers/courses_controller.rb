class CoursesController < ApplicationController

	before_action :signed_in_user,   only: [:new, :create, :destroy]

	def index
		@courses = Course.all
	end

  def create
  @course = Course.new(course_params)

    if @course.save

      if params[:images]
        #===== The magic is here ;)
        params[:images].each { |image|
          @course.pictures.create(image: image)
        }
      end

      flash[:success] = 'Photos successfully updated!'
      redirect_to courses_url
      
    else
      flash.now[:error] = 'Gallery was not created, try again'
      render 'new'
    end

  end

  def new
  	@course = Course.new
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Course deleted."
    redirect_to courses_url
  end




	private

		def signed_in_user
      		unless signed_in?
        		store_location
        		redirect_to signin_url, notice: "Please sign in."
      		end
    	end

    	def course_params
    		params.require(:course).permit(:name, :description, pictures_attributes: 
    			[:image, :description])
    	end
end
