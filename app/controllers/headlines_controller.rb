class HeadlinesController < ApplicationController
	before_action :signed_in_user

	def edit_apply_headline
		@headline = Headline.first
	end

	def update_apply_headline
		@headline = Headline.first
		if @headline.update_attributes(headline_params)
			flash[:success] = 'Headline updated'
			redirect_to apply_path(1)
		else
			flash.now[:error] = 'Some error occurred, headline not updated'
			render 'edit_apply_headline'
		end
	end

	def edit_contact_headline
		@headline = Headline.first
	end

	def update_contact_headline
		@headline = Headline.first
		if @headline.update_attributes(headline_params)
			flash[:success] = 'Headline updated'
			redirect_to contact_path(1)
		else
			flash.now[:error] = 'Some error occurred, headline not updated'
			render 'edit_apply_headline'
		end
	end

	def edit_courses_headline
		@headline = Headline.first
	end

	def update_courses_headline
		@headline = Headline.first
		if @headline.update_attributes(headline_params)
			flash[:success] = 'Headline updated'
			redirect_to courses_path
		else
			flash.now[:error] = 'Some error occurred, headline not updated'
			render 'edit_apply_headline'
		end
	end

	def edit_donates_headline
		@headline = Headline.first
	end

	def update_donates_headline
		@headline = Headline.first
		if @headline.update_attributes(headline_params)
			flash[:success] = 'Headline updated'
			redirect_to donate_path(1)
		else
			flash.now[:error] = 'Some error occurred, headline not updated'
			render 'edit_apply_headline'
		end
	end

	def edit_enrichments_headline
		@headline = Headline.first
	end

	def update_enrichments_headline
		@headline = Headline.first
		if @headline.update_attributes(headline_params)
			flash[:success] = 'Headline updated'
			redirect_to enrichment_path(1)
		else
			flash.now[:error] = 'Some error occurred, headline not updated'
			render 'edit_apply_headline'
		end
	end

	def edit_faqs_headline
		@headline = Headline.first
	end

	def update_faqs_headline
		@headline = Headline.first
		if @headline.update_attributes(headline_params)
			flash[:success] = 'Headline updated'
			redirect_to faqs_path
		else
			flash.now[:error] = 'Some error occurred, headline not updated'
			render 'edit_apply_headline'
		end
	end

	def edit_histories_headline
		@headline = Headline.first
	end

	def update_histories_headline
		@headline = Headline.first
		if @headline.update_attributes(headline_params)
			flash[:success] = 'Headline updated'
			redirect_to history_path(1)
		else
			flash.now[:error] = 'Some error occurred, headline not updated'
			render 'edit_apply_headline'
		end
	end

	def edit_media_headline
		@headline = Headline.first
	end

	def update_media_headline
		@headline = Headline.first
		if @headline.update_attributes(headline_params)
			flash[:success] = 'Headline updated'
			redirect_to media_path
		else
			flash.now[:error] = 'Some error occurred, headline not updated'
			render 'edit_apply_headline'
		end
	end

	def edit_press_headline
		@headline = Headline.first
	end

	def update_press_headline
		@headline = Headline.first
		if @headline.update_attributes(headline_params)
			flash[:success] = 'Headline updated'
			redirect_to press_path(1)
		else
			flash.now[:error] = 'Some error occurred, headline not updated'
			render 'edit_apply_headline'
		end
	end

	def edit_results_headline
		@headline = Headline.first
	end

	def update_results_headline
		@headline = Headline.first
		if @headline.update_attributes(headline_params)
			flash[:success] = 'Headline updated'
			redirect_to result_path(1)
		else
			flash.now[:error] = 'Some error occurred, headline not updated'
			render 'edit_apply_headline'
		end
	end

	def edit_staffs_headline
		@headline = Headline.first
	end

	def update_staffs_headline
		@headline = Headline.first
		if @headline.update_attributes(headline_params)
			flash[:success] = 'Headline updated'
			redirect_to staffs_path
		else
			flash.now[:error] = 'Some error occurred, headline not updated'
			render 'edit_apply_headline'
		end
	end

	def edit_studies_headline
		@headline = Headline.first
	end

	def update_studies_headline
		@headline = Headline.first
		if @headline.update_attributes(headline_params)
			flash[:success] = 'Headline updated'
			redirect_to study_path(1)
		else
			flash.now[:error] = 'Some error occurred, headline not updated'
			render 'edit_apply_headline'
		end
	end

	def edit_volunteers_headline
		@headline = Headline.first
	end

	def update_volunteers_headline
		@headline = Headline.first
		if @headline.update_attributes(headline_params)
			flash[:success] = 'Headline updated'
			redirect_to volunteer_path(1)
		else
			flash.now[:error] = 'Some error occurred, headline not updated'
			render 'edit_apply_headline'
		end
	end



	private

  	def headline_params
  		params.require(:headline).permit(:apply, :contact, :courses, 
  			:donates, :enrichments, :faqs, :histories, :media, :press, 
  			:results, :staffs, :studies, :volunteers)
  	end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
