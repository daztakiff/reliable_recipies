class CreateChefs < ActiveRecord::Migration[7.2]
  def change
    create_table :chefs do |t|
      t.string :username
      t.string :role

      t.timestamps
    end
  end
end
