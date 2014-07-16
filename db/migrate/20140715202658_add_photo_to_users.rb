class AddPhotoToUsers < ActiveRecord::Migration
  def self.up
    add_attachment :home_pages, :photo
  end

  def self.down
    remove_attachment :home_pages, :photo
  end
end
