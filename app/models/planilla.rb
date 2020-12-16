class Planilla < ApplicationRecord
	validates :temp, presence: {message:" El campo temperatura es obligatorio "}
	validates_inclusion_of :ext14, {in: [true, false] ,message:" El campo 2 es obligatorio "}
    validates_inclusion_of :cont14, {in: [true, false] ,message:" El campo 3 es obligatorio "}
    validates_inclusion_of :sintomas, {in: [true, false] ,message:" El campo 4 es obligatorio "}
    validates_inclusion_of :fiebre, {in: [true, false] ,message:" El campo 5 es obligatorio "}
    validates_inclusion_of :fiebre, {in: [true, false] ,message:" El campo 6 es obligatorio "}
    validates_inclusion_of :fiebre, {in: [true, false] ,message:" El campo 7 es obligatorio "}
    validates_inclusion_of :fiebre, {in: [true, false] ,message:" El campo 8 es obligatorio "}
    validates_inclusion_of :fiebre, {in: [true, false] ,message:" El campo 9 es obligatorio "}
    validates_inclusion_of :fiebre, {in: [true, false] ,message:" El campo 10 es obligatorio "}
    validates_inclusion_of :fiebre, {in: [true, false] ,message:" El campo 11 es obligatorio "}
    validates_inclusion_of :fiebre, {in: [true, false] ,message:" El campo 12 es obligatorio "}
    validates_inclusion_of :fiebre, {in: [true, false] ,message:" El campo 13 es obligatorio "}
    validates_inclusion_of :fiebre, {in: [true, false] ,message:" El campo 14 es obligatorio "}
end