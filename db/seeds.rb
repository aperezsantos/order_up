# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
chef = Chef.create!(name: "Ramsay")
dish = chef.dishes.create!(name: "Beef Wellington", description: "Ramsey's most famous dish")

ingredient_1 = Ingredient.create!(name: "Filet Mignon", calories: 600)
ingredient_2 = Ingredient.create!(name: "Olive Oil", calories: 200)
ingredient_3 = Ingredient.create!(name: "Puff Pastry", calories: 200)

DishIngredient.create!(dish: dish, ingredient: ingredient_1)
DishIngredient.create!(dish: dish, ingredient: ingredient_2)
DishIngredient.create!(dish: dish, ingredient: ingredient_3)
