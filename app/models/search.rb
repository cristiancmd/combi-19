class Search < ApplicationRecord

	def self.buscar(origen_id,destino_id, fecha)
		

		ruta = Route.all
		ruta = ruta.where(initial_city_id: origen_id ) if origen_id.present? 
		ruta = ruta.where(destination_city_id: destino_id ) if destino_id.present? 
		viajes = Trip.where(route_id: ruta) 

		
		viajes = viajes.where("date(horario) = ?", fecha) if fecha.present?
		
		return viajes

	end

end
