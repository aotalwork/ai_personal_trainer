class UserIntolerance < ApplicationRecord
  belongs_to :user
  belongs_to :intolerance
end