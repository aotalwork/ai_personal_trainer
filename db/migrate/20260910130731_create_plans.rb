class CreatePlans < ActiveRecord::Migration[8.1]
  def change
    create_table :plans do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :goal
      t.integer :duration_weeks
      t.string :status
      t.datetime :generated_at

      t.timestamps
    end
  end
end
