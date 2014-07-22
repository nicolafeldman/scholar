class CreateEnrichments < ActiveRecord::Migration
  def change
    create_table :enrichments do |t|
    	t.text :text

      t.timestamps
    end
  end
end
