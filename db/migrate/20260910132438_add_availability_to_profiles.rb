class AddAvailabilityToProfiles < ActiveRecord::Migration[8.1]
  def change
    add_column :profiles, :available_days, :text
    add_column :profiles, :preferred_training_time, :string
  end
end
