class CalendarEvent < ApplicationRecord
  belongs_to :user
  belongs_to :workout, optional: true

  validates :google_event_id,
            uniqueness: true,
            allow_nil: true
end