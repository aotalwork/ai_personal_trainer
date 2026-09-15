class Export < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  validates :export_type, presence: true
  validates :status, presence: true
end