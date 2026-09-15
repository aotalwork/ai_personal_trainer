class CreateCalendarEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :calendar_events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true
      t.string :google_event_id
      t.datetime :starts_at
      t.datetime :ends_at
      t.datetime :synced_at

      t.timestamps
    end
  end
end
