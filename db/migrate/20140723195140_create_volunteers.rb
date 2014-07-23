class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
    	t.text :text

      t.timestamps
    end
  end
end
