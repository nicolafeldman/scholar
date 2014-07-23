class CreateDonates < ActiveRecord::Migration
  def change
    create_table :donates do |t|
    	t.text :text

      t.timestamps
    end
  end
end
