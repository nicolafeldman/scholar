class AddPhotoFileNameToAttachments < ActiveRecord::Migration
  def change
  	add_column :attachments, :photo_file_name, :string
  end
end
