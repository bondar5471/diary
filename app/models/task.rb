class Task < ApplicationRecord
	belongs_to :day
	validates :list, presence: true	
end
