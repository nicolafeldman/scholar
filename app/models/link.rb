class Link < ActiveRecord::Base
	belongs_to :press
	validates :press_id, presence: true
end
