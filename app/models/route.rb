class Route < ApplicationRecord
	belongs_to :initial_city, class_name: 'City'
	belongs_to :destination_city, class_name: 'City'

	validates :initial_city, presence: true
	validates :destination_city, presence: true
	validates :check_equality , presence: true

	

	

	def check_equality
	    initial_city.id != destination_city.id
	end
end
