class MealItem < ApplicationRecord
  belongs_to :meal
  belongs_to :food

  validates :quantity_grams,
            numericality: { greater_than: 0 }
end