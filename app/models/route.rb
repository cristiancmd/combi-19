class Route < ApplicationRecord
	belongs_to :inicio, class_name: 'City', foreign_key: :inicio_id
	belongs_to :destino, class_name: 'City', foreign_key: :destino_id
end
