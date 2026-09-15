class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_one :health_profile, dependent: :destroy

  has_many :user_allergies, dependent: :destroy
  has_many :allergies, through: :user_allergies

  has_many :user_intolerances, dependent: :destroy
  has_many :intolerances, through: :user_intolerances

  has_many :gyms, dependent: :destroy
  has_many :plans, dependent: :destroy
  has_many :progress_measurements, dependent: :destroy
  has_many :calendar_events, dependent: :destroy
  has_many :exports, dependent: :destroy
end