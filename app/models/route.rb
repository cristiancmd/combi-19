class Route < ApplicationRecord
	belongs_to :initial_city, class_name: 'City'
	belongs_to :destination_city, class_name: 'City'
end
