class AddPhotoContentTypeToAttachments < ActiveRecord::Migration
  def change
  	add_column :attachments, :photo_content_type, :string
  end
end
