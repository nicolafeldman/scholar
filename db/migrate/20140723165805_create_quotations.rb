class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
    	t.string :quote
    	t.string :attribution

      t.timestamps
    end
  end
end
