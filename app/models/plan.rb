class Plan < ApplicationRecord
  belongs_to :user

  has_many :workouts, dependent: :destroy
  has_one :meal_plan, dependent: :destroy
  has_many :exports, dependent: :destroy

  validates :duration_weeks,
            numericality: { greater_than: 0 },
            allow_nil: true
end