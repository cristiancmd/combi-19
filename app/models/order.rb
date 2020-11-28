class Order < ApplicationRecord
	belongs_to :user
	belongs_to :trip
	validates :tarjeta, presence: true,  format: { with: /[0-9]{12}(?:[0-9]{3})?/ } #{message:"Debe ingresar una tarjeta!"}
	validate :validar_fondos
	
	
	def validar_tarjeta?
		tarjeta =~ /4[0-9]{12}(?:[0-9]{3})?/
		
	end
	def validar_fondos
		str = tarjeta.to_s
		if str[-1] == '0'
			errors.add(:tarjeta, "La tarjeta no tiene fondos")


		end
	end


end
