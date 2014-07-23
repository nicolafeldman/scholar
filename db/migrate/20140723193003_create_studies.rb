class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
    	t.text :text

      t.timestamps
    end
  end
end
