class Chofer < ApplicationRecord
	validates :dni, presence: true
	validates :dni, uniqueness: {message:": El Chofer ya existe!" }
	

	def nombre_apellido
    	"#{nombre} #{apellido}"
  	end

	end
