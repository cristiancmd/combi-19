class Planilla < ApplicationRecord
	validates :temp, presence: {message:" El campo 1 es obligatorio "}
	validates :ext14, presence: {message:" El campo 2 es obligatorio "}
    validates :cont14, presence: {message:" El campo 3 es obligatorio "}
    validates :sintomas, presence: {message:" El campo 4 es obligatorio "}
    validates :fiebre, presence: {message:" El campo 5 es obligatorio "}
    validates :garganta, presence: {message:" El campo 6 es obligatorio "}
    validates :hipt, presence: {message:" El campo 7 es obligatorio "}
    validates :eResp, presence: {message:" El campo 8 es obligatorio "}
    validates :diabetes, presence: {message:" El campo 9 es obligatorio "}
    validates :inmDep, presence: {message:" El campo 10 es obligatorio "}
    validates :corazon, presence: {message:" El campo 11 es obligatorio "}
    validates :hijos, presence: {message:" El campo 12 es obligatorio "}
    validates :embarazada, presence: {message:" El campo 13 es obligatorio "}
    validates :cFiebre, presence: {message:" El campo 14 es obligatorio "}
end
