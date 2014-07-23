class AddDonateIdToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :donate_id, :integer
  end
end
