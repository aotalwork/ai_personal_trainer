class ProgressMeasurement < ApplicationRecord
  belongs_to :user

  validates :weight_kg,
            numericality: { greater_than: 0 },
            allow_nil: true
end