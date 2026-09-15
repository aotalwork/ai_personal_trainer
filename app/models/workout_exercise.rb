class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise

  validates :sets,
            numericality: { greater_than: 0 },
            allow_nil: true
end