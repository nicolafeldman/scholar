class CreatePresses < ActiveRecord::Migration
  def change
    create_table :presses do |t|
      t.text :text

      t.timestamps
    end
  end
end
