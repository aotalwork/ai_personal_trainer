class AddSafetyFieldsToHealthProfiles < ActiveRecord::Migration[8.1]
  def change
    add_column :health_profiles, :has_current_pain, :boolean
    add_column :health_profiles, :pain_description, :text
    add_column :health_profiles, :has_injury, :boolean
    add_column :health_profiles, :emergency_contact_name, :string
    add_column :health_profiles, :emergency_contact_phone, :string
  end
end
