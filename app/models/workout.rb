class Workout < ApplicationRecord
  belongs_to :plan

  has_many :workout_exercises, dependent: :destroy
  has_many :exercises, through: :workout_exercises

  has_many :calendar_events, dependent: :nullify
end