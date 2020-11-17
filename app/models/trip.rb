class Trip < ApplicationRecord
	has_many :chofers
	has_many :routes
	has_many :buses
	belongs_to :chofer, class_name: 'Chofer'
	belongs_to :bus, class_name: 'Bus'
	belongs_to :route, class_name: 'Route'


	scope :tiene_chofer, -> (chofer) { where(chofer_id: chofer) }
	scope :tiene_ruta, -> (r) { where(route_id: r) }


end
