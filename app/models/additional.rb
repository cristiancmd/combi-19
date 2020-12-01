class Additional < ApplicationRecord

	 validates :nombre, presence: true
	 validates :precio, :numericality => { :greater_than_or_equal_to => 0 ,message:" Debe ser mayor a 0"}
	 validates :stock, :numericality => { :greater_than_or_equal_to => 0 , message:" Debe ser mayor a 0"}
	 validates :nombre, uniqueness: {message:": El extra ya existe!", case_sensitive: false }

	 def self.buscar(busqueda)
	 	if busqueda
	 		asd = Additional.where(nombre: busqueda)
	 		return asd
	 	else
	 		return Additional.all
	 	end
	 end

end
