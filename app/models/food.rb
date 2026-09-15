class Food < ApplicationRecord
  has_many :meal_items, dependent: :destroy
  has_many :meals, through: :meal_items

  validates :name, presence: true
end