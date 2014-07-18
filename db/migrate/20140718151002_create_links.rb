class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :text_before
      t.text :text_after
      t.text :link_text
      t.text :url

      t.timestamps
    end
  end
end
