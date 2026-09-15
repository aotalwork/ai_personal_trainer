class Profile < ApplicationRecord
  belongs_to :user

  SEXES = %w[male female other prefer_not_to_say].freeze

  GOALS = %w[
    fat_loss
    muscle_gain
    recomposition
    strength
    performance
    maintenance
  ].freeze

  ACTIVITY_LEVELS = %w[
    sedentary
    lightly_active
    moderately_active
    very_active
    extremely_active
  ].freeze

  validates :height_cm,
            numericality: { greater_than: 0 },
            allow_nil: true

  validates :weight_kg,
            numericality: { greater_than: 0 },
            allow_nil: true

  validates :sex,
            inclusion: { in: SEXES },
            allow_nil: true

  validates :goal,
            inclusion: { in: GOALS },
            allow_nil: true

  validates :activity_level,
            inclusion: { in: ACTIVITY_LEVELS },
            allow_nil: true
end