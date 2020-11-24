class Additional < ApplicationRecord

	 validates :nombre, presence: true
	 validates :precio, :numericality => { :greater_than_or_equal_to => 0 ,message:" Debe ser mayor a 0"}
	 validates :stock, :numericality => { :greater_than_or_equal_to => 0 , message:" Debe ser mayor a 0"}
	 validates :nombre, uniqueness: {message:": El extra ya existe!", case_sensitive: false }
end
