class AddVolunteerIdToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :volunteer_id, :integer
  end
end
