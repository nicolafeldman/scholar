class AddLinkColumnsToApply < ActiveRecord::Migration
  def change
  	add_column :applies, :text_before, :text
  	add_column :applies, :text_after, :text
  	add_column :applies, :link_text, :text
  	add_column :applies, :url, :text
  end
end
