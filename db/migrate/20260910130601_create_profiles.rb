class CreateProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :sex
      t.decimal :height_cm
      t.decimal :weight_kg
      t.string :goal
      t.string :activity_level
      t.string :location

      t.timestamps
    end
  end
end
