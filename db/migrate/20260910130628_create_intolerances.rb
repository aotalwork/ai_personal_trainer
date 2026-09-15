class CreateIntolerances < ActiveRecord::Migration[8.1]
  def change
    create_table :intolerances do |t|
      t.string :name

      t.timestamps
    end
  end
end
