class Meal < ApplicationRecord
  belongs_to :meal_plan

  has_many :meal_items, dependent: :destroy
  has_many :foods, through: :meal_items
end