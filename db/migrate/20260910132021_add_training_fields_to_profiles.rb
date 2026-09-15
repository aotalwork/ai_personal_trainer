class AddTrainingFieldsToProfiles < ActiveRecord::Migration[8.1]
  def change
    add_column :profiles, :training_location, :string
    add_column :profiles, :training_days_per_week, :integer
    add_column :profiles, :training_minutes_per_session, :integer
    add_column :profiles, :training_experience, :string
  end
end
