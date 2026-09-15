class Equipment < ApplicationRecord
  has_many :gym_equipment, dependent: :destroy
  has_many :gyms, through: :gym_equipment

  has_many :exercise_equipment, dependent: :destroy
  has_many :exercises, through: :exercise_equipment

  validates :name, presence: true
end