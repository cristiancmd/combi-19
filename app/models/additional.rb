class Additional < ApplicationRecord

	 validates :nombre, presence: true
	 validates :precio, :numericality => { :greater_than_or_equal_to => 0 ,message:" Debe ser mayor a 0"}
	 validates :stock, :numericality => { :greater_than_or_equal_to => 0 , message:" Debe ser mayor a 0"}
	 validates :nombre, uniqueness: {message:": El extra ya existe!", case_sensitive: false }

	 def self.buscar(search_term)
	 	if search_term and search_term != ""
	 		return Additional.where("nombre LIKE ?", "%" + search_term +"%")
	 	else
	 		return Additional.all 
	 	end
	 end

end
