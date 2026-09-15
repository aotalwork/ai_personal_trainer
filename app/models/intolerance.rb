class Intolerance < ApplicationRecord
  has_many :user_intolerances, dependent: :destroy
  has_many :users, through: :user_intolerances

  validates :name, presence: true, uniqueness: true
end