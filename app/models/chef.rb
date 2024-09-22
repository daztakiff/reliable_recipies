class Chef < ApplicationRecord
  has_many :recipes, foreign_key: 'recipe_owner'
end
