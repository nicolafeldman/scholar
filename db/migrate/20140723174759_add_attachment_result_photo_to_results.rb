class AddAttachmentResultPhotoToResults < ActiveRecord::Migration
  def self.up
    add_attachment :results, :result_photo
  end

  def self.down
    remove_attachment :results, :result_photo
  end
end
