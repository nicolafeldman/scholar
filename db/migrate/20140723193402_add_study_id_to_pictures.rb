class AddStudyIdToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :study_id, :integer
  end
end
