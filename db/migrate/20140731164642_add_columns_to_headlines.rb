class AddColumnsToHeadlines < ActiveRecord::Migration
  def change
  	add_column :headlines, :apply, :text
  	add_column :headlines, :contact, :text
  	add_column :headlines, :courses, :text
  	add_column :headlines, :donates, :text
  	add_column :headlines, :enrichments, :text
  	add_column :headlines, :faqs, :text
  	add_column :headlines, :histories, :text
  	add_column :headlines, :media, :text
  	add_column :headlines, :press, :text
  	add_column :headlines, :results, :text
  	add_column :headlines, :staffs, :text
  	add_column :headlines, :studies, :text
  	add_column :headlines, :volunteers, :text
  end
end
