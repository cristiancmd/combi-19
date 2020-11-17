class Chofer < ApplicationRecord
	validates :dni, presence: true
	validates :dni, uniqueness: {message:": El DNI ya existe!" }
	

	
	
end
