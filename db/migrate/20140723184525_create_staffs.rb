class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
    	t.text :text

      t.timestamps
    end
  end
end
