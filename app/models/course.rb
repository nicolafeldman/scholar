class Course < ActiveRecord::Base
	has_many :pictures

	accepts_nested_attributes_for :pictures
end
