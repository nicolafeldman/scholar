class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :layout_data

  private

  	def layout_data
  		@enrichment = Enrichment.last
  		@donate = Donate.last
      @gallery = Gallery.last
      @study = Study.last
      @volunteer = Volunteer.last
      @quotations = Quotation.all.sample(1)
  	end
end
