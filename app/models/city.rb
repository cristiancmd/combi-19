class City < ApplicationRecord
	 validates :nombre, presence: true
	 validates :nombre, uniqueness: {message:": La ciudad ya existe!", case_sensitive: false }
end
