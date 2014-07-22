class AddHomePageIdToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :home_page_id, :integer
  end
end
