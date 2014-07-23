class History < ActiveRecord::Base
	has_attached_file :history_photo, :default_url => "/images/missing.png"

	do_not_validate_attachment_file_type :history_photo
end
