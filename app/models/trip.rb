class Trip < ApplicationRecord
	has_many :chofers
	has_many :routes
	has_many :buses
	belongs_to :chofer, class_name: 'Chofer'
	belongs_to :bus, class_name: 'Bus'
	belongs_to :route, class_name: 'Route'

#validaciones
	validates :horario, presence: {message:": Debe seleccionar horario y dia!"}
	validates :chofer, presence: {message:": Debe seleccionar un chofer!"}
	validates :bus, presence: {message:": Debe seleccionar combi!"}
	validates :route, presence: {message:": Debe seleccionar una ruta!"}


	
#scopes
	scope :tiene_chofer, -> (chofer) { where(chofer_id: chofer) }
	scope :en_dia, -> (dia) { where(horario: dia ) }
	scope :tiene_ruta, -> (r) { where(route_id: r) }


	def self.tiene_chofer_dia(chofer,dia)
		where(chofer_id: chofer).where(horario: dia)
	end

end
