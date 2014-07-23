class AddAttachmentHistoryPhotoToHistories < ActiveRecord::Migration
  def self.up
    add_attachment :histories, :history_photo
  end

  def self.down
    remove_attachment :histories, :history_photo
  end
end
