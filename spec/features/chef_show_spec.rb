RSpec.describe "Chef Show Page", type: :feature do
  describe "when I visit a chef show page" do
    it "I see a list of its ingredients and the chef's name" do
      chef = Chef.create!(name: "Ramsay")
      dish = chef.dishes.create!(name: "Beef Wellington", description: "Ramsey's most famous dish")

      ingredient_1 = Ingredient.create!(name: "Filet Mignon", calories: 600)
      ingredient_2 = Ingredient.create!(name: "Olive Oil", calories: 200)
      ingredient_3 = Ingredient.create!(name: "Puff Pastry", calories: 200)

      DishIngredient.create!(dish: dish, ingredient: ingredient_1)
      DishIngredient.create!(dish: dish, ingredient: ingredient_2)
      DishIngredient.create!(dish: dish, ingredient: ingredient_3)

      visit "/chefs/#{chef.id}"

      expect(page).to have_content(chef.name)

      click_link "My Ingredients"

      expect(current_path).to eq("/ingredients")

      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
    end

    # it "I see the three most popular ingredients" do
    #   chef = Chef.create!(name: "Ramsay")
    #   dish = chef.dishes.create!(name: "Beef Wellington", description: "Ramsey's most famous dish")
    #   dish_2 = chef.dishes.create!(name: "Idiot Sandwich", description: "Falls apart under pressure")
    #   dish_3 = chef.dishes.create!(name: "Pasta", description: "Best undercooked")
    #
    #   ingredient_1 = Ingredient.create!(name: "Filet Mignon", calories: 600)
    #   ingredient_2 = Ingredient.create!(name: "Olive Oil", calories: 200)
    #   ingredient_3 = Ingredient.create!(name: "Puff Pastry", calories: 200)
    #   ingredient_4 = Ingredient.create!(name: "Pasta", calories: 400)
    #
    #   DishIngredient.create!(dish: dish, ingredient: ingredient_1)
    #   DishIngredient.create!(dish: dish, ingredient: ingredient_2)
    #   DishIngredient.create!(dish: dish, ingredient: ingredient_1)
    #   DishIngredient.create!(dish: dish, ingredient: ingredient_4)
    #   DishIngredient.create!(dish: dish_2, ingredient: ingredient_3)
    #   DishIngredient.create!(dish: dish_3, ingredient: ingredient_2)
    #
    #   visit "/chefs/#{chef.id}"
    #
    #   expect(page).to have_content(ingredient_3.name)
    #   expect(page).to have_content(ingredient_3.name)
    #   expect(page).to have_content(ingredient_4.name)
    # end
  end
end


# Extension
# As a visitor
# When I visit a chef's show page
# I see the three most popular ingredients that the chef uses in their dishes
# (Popularity is based off of how many dishes use that ingredient)
