class Picture < ActiveRecord::Base
  #attr_accessible :description, :gallery_id, :image, :medium_id

  belongs_to :medium

  has_attached_file :image,
  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  do_not_validate_attachment_file_type :image
end
