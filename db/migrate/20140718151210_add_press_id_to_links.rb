class AddPressIdToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :press_id, :integer
  end
end
