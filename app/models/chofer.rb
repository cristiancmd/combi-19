class Chofer < ApplicationRecord
	validates :nombre , :apellido, :dni, presence: true
	validates :dni, uniqueness: {message:": El chofer ya existe!", case_sensitive: false }
end
