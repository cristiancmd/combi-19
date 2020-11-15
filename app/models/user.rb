class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :date_of_birth, :presence => true
  validate :validate_age

  private

  def validate_age
      if date_of_birth.present? && date_of_birth.to_i > 18.years.ago.to_i
          errors.add(:date_of_birth, 'Deberias tener 18 años o mas para operar en el sitio.')
      end
  end       
end
