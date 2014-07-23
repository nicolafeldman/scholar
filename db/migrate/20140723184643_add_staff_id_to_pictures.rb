class AddStaffIdToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :staff_id, :integer
  end
end
