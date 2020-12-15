class Planilla < ApplicationRecord
	validates :temp, presence: true
	validates :ext14, presence: true
    validates :cont14, presence: true
    validates :sintomas, presence: true
    validates :fiebre, presence: true
    validates :garganta, presence: true
    validates :hipt, presence: true
    validates :eResp, presence: true
    validates :diabetes, presence: true
    validates :inmDep, presence: true
    validates :corazon, presence: true
    validates :hijos, presence: true
    validates :embarazada, presence: true
    validates :cFiebre, presence: true
end
