class Additional < ApplicationRecord

	 validates :nombre, presence: true
	 validates :nombre, uniqueness: {message:": El extra ya existe!", case_sensitive: false }
end
