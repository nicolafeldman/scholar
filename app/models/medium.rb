class Medium < ActiveRecord::Base
	#attr_accessible :description, :name, :pictures

  	has_many :pictures, :dependent => :destroy

  	accepts_nested_attributes_for :pictures
end
