class AddVideo1AndVideo2ToMedium < ActiveRecord::Migration
  def change
  	add_column :media, :video1, :string
  	add_column :media, :video2, :string
  end
end
