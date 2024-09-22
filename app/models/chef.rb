class Chef < ApplicationRecord
  has_many :recipes, foreign_key: "recipe_owner"

  ROLES = [ "Chef de cuisine", "Sous-chef de cuisine", "Cuisinier" ]
end
