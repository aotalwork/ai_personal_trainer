class CreateExercises < ActiveRecord::Migration[8.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.string :muscle_group
      t.string :difficulty
      t.string :movement_pattern
      t.text :instructions
      t.text :contraindications

      t.timestamps
    end
  end
end
