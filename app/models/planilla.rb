class Planilla < ApplicationRecord
	validates :temp, presence: {message:" El campo temperatura es obligatorio "}
	
    validates_inclusion_of :ext14, {in: [true, false] ,message:" El campo 2 es obligatorio "}
    validates_inclusion_of :cont14, {in: [true, false] , message:" El campo 3 es obligatorio "}
end
