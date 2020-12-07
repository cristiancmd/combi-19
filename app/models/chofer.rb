class Chofer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	include PgSearch::Model
	#validates :dni, presence: true
	validates :dni, uniqueness: {message:": El DNI ya existe!" }
	has_many :trips
	

	def nombre_apellido
    	"#{nombre} #{apellido} "
  	end

  	def self.buscar(search_term)
	 	if search_term and search_term != ""
	 		a = Chofer.where("nombre LIKE ? ", "%" + search_term +"%")
	 		b = Chofer.where("apellido LIKE ?", "%" + search_term +"%")
	 		c = Chofer.where("dni LIKE ?", "%" + search_term +"%")
	 		if a.any?
	 			return a
	 		elsif b.any?
	 			return b
	 		elsif c.any?
	 			return c
	 		else
	 			return Chofer.all
	 		end
	 			

	 		#return Chofer.where("nombre LIKE ? or apellido LIKE ? or dni LIKE ?", "%" + search_term +"%")
	 	else
	 		return Chofer.all 
	 	end
	 end

	end
