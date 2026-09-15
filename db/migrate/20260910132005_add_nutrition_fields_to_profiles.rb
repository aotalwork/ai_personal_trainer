class AddNutritionFieldsToProfiles < ActiveRecord::Migration[8.1]
  def change
    add_column :profiles, :diet_type, :string
    add_column :profiles, :meals_per_day, :integer
    add_column :profiles, :food_preferences, :text
    add_column :profiles, :disliked_foods, :text
    add_column :profiles, :budget_level, :string
  end
end
