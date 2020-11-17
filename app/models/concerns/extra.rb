class Extra < ApplicationRecord

	 validates :patente, presence: true
	 validates :patente, uniqueness: {message:": La combi ya existe!", case_sensitive: false }
end
