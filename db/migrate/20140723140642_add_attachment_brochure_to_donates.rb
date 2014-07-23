class AddAttachmentBrochureToDonates < ActiveRecord::Migration
  def self.up
    add_attachment :donates, :brochure
  end

  def self.down
    remove_attachment :donates, :brochure
  end
end