class Result < ActiveRecord::Base
	has_attached_file :result_photo, :default_url => "/images/missing.png"

	do_not_validate_attachment_file_type :result_photo
end
