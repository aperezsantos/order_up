require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'class methods' do
    it '.popular_ingredients' do
      chef = Chef.create!(name: "Ramsay")
      dish_1 = chef.dishes.create!(name: "Idiot Sandwich", description: "Falls apart under pressure")
      dish_2 = chef.dishes.create!(name: "Pasta", description: "Best undercooked")

      ingredient_1 = Ingredient.create!(name: "Filet Mignon", calories: 600)
      ingredient_2 = Ingredient.create!(name: "Olive Oil", calories: 200)
      ingredient_3 = Ingredient.create!(name: "Puff Pastry", calories: 200)

      DishIngredient.create!(dish: dish_1, ingredient: ingredient_1)
      DishIngredient.create!(dish: dish_1, ingredient: ingredient_2)
      DishIngredient.create!(dish: dish_2, ingredient: ingredient_1)

      expect(chef.popular_ingredients).to eq(ingredient_1)
    end
  end
end
