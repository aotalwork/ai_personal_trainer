class Exercise < ApplicationRecord
  has_many :exercise_equipment, dependent: :destroy
  has_many :equipment, through: :exercise_equipment

  has_many :workout_exercises, dependent: :destroy
  has_many :workouts, through: :workout_exercises

  validates :name, presence: true
end