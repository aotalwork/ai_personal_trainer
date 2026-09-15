class CreateWorkouts < ActiveRecord::Migration[8.1]
  def change
    create_table :workouts do |t|
      t.references :plan, null: false, foreign_key: true
      t.date :scheduled_date
      t.string :name
      t.string :focus
      t.integer :duration_minutes
      t.text :notes

      t.timestamps
    end
  end
end
