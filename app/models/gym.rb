class Gym < ApplicationRecord
  belongs_to :user

  has_many :gym_equipment, dependent: :destroy
  has_many :equipment, through: :gym_equipment
end