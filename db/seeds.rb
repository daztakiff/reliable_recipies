# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Clear existing data
Chef.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
RecipeIngredient.destroy_all

# Create some chefs
chef1 = Chef.create!(username: "GordonRamsay", role: "Head Chef", created_at: Time.now)
chef2 = Chef.create!(username: "JamieOliver", role: "Sous Chef", created_at: Time.now)
chef3 = Chef.create!(username: "NigellaLawson", role: "Pastry Chef", created_at: Time.now)

# Create some ingredients
ingredient1 = Ingredient.create!(name: "Flour", stores_available: "Supermarket", created_at: Time.now)
ingredient2 = Ingredient.create!(name: "Sugar", stores_available: "Supermarket", created_at: Time.now)
ingredient3 = Ingredient.create!(name: "Butter", stores_available: "Supermarket", created_at: Time.now)
ingredient4 = Ingredient.create!(name: "Eggs", stores_available: "Farm", created_at: Time.now)

# Create some recipes
recipe1 = Recipe.create!(recipe_name: "Pancakes", recipe_description: "Fluffy pancakes made from scratch.", recipe_owner: chef1.id, created_at: Time.now)
recipe2 = Recipe.create!(recipe_name: "Cookies", recipe_description: "Chocolate chip cookies.", recipe_owner: chef2.id, created_at: Time.now)
recipe3 = Recipe.create!(recipe_name: "Cake", recipe_description: "Classic vanilla cake.", recipe_owner: chef3.id, created_at: Time.now)

# Associate recipes with ingredients through the RecipeIngredient join table
RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient1)  # Pancakes -> Flour
RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient3)  # Pancakes -> Butter
RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient4)  # Pancakes -> Eggs

RecipeIngredient.create!(recipe: recipe2, ingredient: ingredient1)  # Cookies -> Flour
RecipeIngredient.create!(recipe: recipe2, ingredient: ingredient2)  # Cookies -> Sugar
RecipeIngredient.create!(recipe: recipe2, ingredient: ingredient3)  # Cookies -> Butter

RecipeIngredient.create!(recipe: recipe3, ingredient: ingredient1)  # Cake -> Flour
RecipeIngredient.create!(recipe: recipe3, ingredient: ingredient2)  # Cake -> Sugar
RecipeIngredient.create!(recipe: recipe3, ingredient: ingredient3)  # Cake -> Butter
RecipeIngredient.create!(recipe: recipe3, ingredient: ingredient4)  # Cake -> Eggs

puts "Seeding complete!"
