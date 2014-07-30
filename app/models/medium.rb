class Medium < ActiveRecord::Base
	#attr_accessible :description, :name, :pictures
	default_scope -> { order('created_at DESC') }

  	has_many :pictures, :dependent => :destroy

  	accepts_nested_attributes_for :pictures
end
