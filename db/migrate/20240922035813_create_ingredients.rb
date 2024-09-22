class CreateIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :ingredients do |t|
      t.text :name
      t.string :stores_available

      t.timestamps
    end
    add_index :ingredients, :name, unique: true
  end
end
