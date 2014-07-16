class AddAttachmentApplicationToApplies < ActiveRecord::Migration
  def self.up
      add_attachment :applies, :application
  end

  def self.down
    remove_attachment :applies, :application
  end
end
