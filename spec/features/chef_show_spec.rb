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
  end
end
