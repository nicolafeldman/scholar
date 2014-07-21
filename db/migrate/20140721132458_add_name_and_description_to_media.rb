class AddNameAndDescriptionToMedia < ActiveRecord::Migration
  def change
  	add_column :media, :name, :string
  	add_column :media, :description, :string
  end
end
