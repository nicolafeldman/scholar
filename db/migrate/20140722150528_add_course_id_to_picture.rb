class AddCourseIdToPicture < ActiveRecord::Migration
  def change
  	add_column :pictures, :course_id, :integer
  end
end
