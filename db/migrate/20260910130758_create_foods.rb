class CreateFoods < ActiveRecord::Migration[8.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :calories
      t.decimal :protein_grams
      t.decimal :carbohydrates_grams
      t.decimal :fat_grams
      t.decimal :fiber_grams
      t.boolean :vegetarian
      t.boolean :vegan
      t.boolean :gluten_free
      t.boolean :lactose_free

      t.timestamps
    end
  end
end
