class Apply < ActiveRecord::Base
	has_attached_file :application, :default_url => "/images/missing.png"
  	validates_attachment_content_type :application, :content_type =>['application/pdf']
end
