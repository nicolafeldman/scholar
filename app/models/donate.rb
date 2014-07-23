class Donate < ActiveRecord::Base
	has_many :pictures
	has_attached_file :brochure, :default_url => "/images/missing.png"

	accepts_nested_attributes_for :pictures
	do_not_validate_attachment_file_type :brochure
end
