class AddMediumIdToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :medium_id, :integer
  end
end
