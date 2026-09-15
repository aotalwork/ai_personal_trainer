class CreateMealPlans < ActiveRecord::Migration[8.1]
  def change
    create_table :meal_plans do |t|
      t.references :plan, null: false, foreign_key: true
      t.decimal :calories
      t.decimal :protein_grams
      t.decimal :carbohydrates_grams
      t.decimal :fat_grams

      t.timestamps
    end
  end
end
