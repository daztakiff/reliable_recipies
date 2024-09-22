class Recipe < ApplicationRecord
  belongs_to :chef, foreign_key: 'recipe_owner'
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
