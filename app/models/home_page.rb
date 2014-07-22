class HomePage < ActiveRecord::Base
	has_many :pictures, :autosave => true

	accepts_nested_attributes_for :pictures
end
