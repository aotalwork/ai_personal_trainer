class CreateHealthProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :health_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :injuries
      t.text :medical_conditions
      t.text :medications
      t.text :physical_limitations
      t.text :professional_restrictions

      t.timestamps
    end
  end
end
