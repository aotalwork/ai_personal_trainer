class CreateProgressMeasurements < ActiveRecord::Migration[8.1]
  def change
    create_table :progress_measurements do |t|
      t.references :user, null: false, foreign_key: true
      t.date :measured_at
      t.decimal :weight_kg
      t.decimal :body_fat_percentage
      t.decimal :waist_cm
      t.integer :energy_level
      t.integer :adherence_percentage
      t.text :notes

      t.timestamps
    end
  end
end
