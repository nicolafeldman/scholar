class Picture < ActiveRecord::Base
  #attr_accessible :description, :gallery_id, :image, :medium_id

  belongs_to :medium
  belongs_to :home_page
  belongs_to :course
  belongs_to :enrichment
  belongs_to :donate
  belongs_to :gallery

  has_attached_file :image,
  :styles => { :medium => "300x300>", :thumb => "150x150>" }

  do_not_validate_attachment_file_type :image
end
