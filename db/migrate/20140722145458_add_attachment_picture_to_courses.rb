class AddAttachmentPictureToCourses < ActiveRecord::Migration
  def self.up
    add_attachment :courses, :picture
  end

  def self.down
    remove_attachment :courses, :picture
  end
end
