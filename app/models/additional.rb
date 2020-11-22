class Additional < ApplicationRecord

	 validates :nombre, presence: true
	 validates :nombre, uniqueness: {message:": El extra ya existe!", case_sensitive: false }
	 validates :precio, :numericality => { :greater_than_or_equal_to => 0 }
	 validates :stock, :numericality => { :greater_than_or_equal_to => 0 }
end
