class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.text :recipe_description
      t.integer :recipe_owner

      t.timestamps
    end
  end
end
