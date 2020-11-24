class Bus < ApplicationRecord

	 validates :patente, presence: {message:": La patente es obligatoria "}
	 validates :tipo, presence: {message:": Seleccione tipo de combi "}
	 validates :asientos, :numericality => { :greater_than_or_equal_to => 0 ,message:" Debe ser mayor a 0"}
	 validates :patente, uniqueness: {message:": La combi ya existe!", case_sensitive: false }
end
