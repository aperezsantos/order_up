require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'class methods' do
    it '.calorie_count' do
      chef = Chef.create!(name: "Ramsay")
      dish = chef.dishes.create!(name: "Beef Wellington", description: "Ramsey's most famous dish")
      ingredient_1 = Ingredient.create!(name: "Filet Mignon", calories: 4)
      ingredient_2 = Ingredient.create!(name: "Olive Oil", calories: 6)
      DishIngredient.create!(dish: dish, ingredient: ingredient_1)
      DishIngredient.create!(dish: dish, ingredient: ingredient_2)

      expect(dish.calorie_count).to eq(10)
    end
  end
end
