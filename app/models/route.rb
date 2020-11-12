class Route < ApplicationRecord
	#belongs_to :inicio, class_name: 'City', foreign_key: :inicio_id
	#belongs_to :destino, class_name: 'City', foreign_key: :destino_id
	has_many :cities
	#has_and_belongs_to_many :cities
end
