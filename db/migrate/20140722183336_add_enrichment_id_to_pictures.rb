class AddEnrichmentIdToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :enrichment_id, :integer
  end
end
