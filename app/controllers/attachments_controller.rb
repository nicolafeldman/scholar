class AttachmentsController < ApplicationController
  def new
  end

  def create
  	@attachment = Attachment.create( attachment_params )
  end

  private

  	def attachment_params
  		params.require(:attachment).permit(:photo)
  	end
end
