class City < ApplicationRecord
	#has_many :routes
	has_and_belongs_to_many :routes 
	#belongs_to :route , optional: true
end
