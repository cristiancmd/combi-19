class Trip < ApplicationRecord
	has_many :chofers
	has_many :routes
	has_many :buses
	belongs_to :chofer, class_name: 'Chofer'
	belongs_to :bus, class_name: 'Bus'
	belongs_to :route, class_name: 'Route'

#validaciones
	validates :horario, presence: {message:": Debe seleccionar horario y dia!"}
	validate :horario_cannot_be_in_the_past

	validates :chofer, presence: {message:": Debe seleccionar un chofer!"}
	validates :bus, presence: {message:": Debe seleccionar combi!"}
	validates :route, presence: {message:": Debe seleccionar una ruta!"}
	validates :rate, presence: {message:": Debe seleccionar una precio para el viaje!"}


	
#scopes
	scope :tiene_chofer, -> (chofer) { where(chofer_id: chofer) }
	scope :en_dia, -> (dia) { where(horario: dia ) }
	scope :tiene_ruta, -> (r) { where(route_id: r) }
	scope :tiene_combi, -> (c) { where(bus_id: c) }

	def self.tiene_chofer_dia(chofer,dia)
		where(chofer_id: chofer).where(horario: dia)
	end

	def self.tiene_combi_dia(combi,dia)
		where(bus_id: combi).where(horario: dia)
	end

	def horario_cannot_be_in_the_past
	    if horario.past?
	      errors.add(:Fecha!, "Debe seleccionar dias futuros")
	    end
  end 


	
end

    