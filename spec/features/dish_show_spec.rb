require "rails_helper"

RSpec.describe "Dish Show Page", type: :feature do
  describe "when I visit a dish show page" do
    it "I see a list of its ingredients and the chef's name" do
      chef = Chef.create!(name: "Ramsay")
      dish = chef.dishes.create!(name: "Beef Wellington", description: "Ramsey's most famous dish")
      dish_2 = chef.dishes.create!(name: "Idiot Sandwich", description: "Falls apart under pressure")

      ingredient_1 = Ingredient.create!(name: "Filet Mignon", calories: 600)
      ingredient_2 = Ingredient.create!(name: "Olive Oil", calories: 200)
      ingredient_3 = Ingredient.create!(name: "Puff Pastry", calories: 200)

      DishIngredient.create!(dish: dish, ingredient: ingredient_1)
      DishIngredient.create!(dish: dish, ingredient: ingredient_2)
      DishIngredient.create!(dish: dish, ingredient: ingredient_3)

      visit "/dishes/#{dish.id}"

      expect(page).to have_content(dish.name)
      expect(page).to_not have_content(dish_2.name)
      expect(page).to have_content(chef.name)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
    end
  end
end
