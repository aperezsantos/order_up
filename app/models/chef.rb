class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def popular_ingredients
    self.dishes
    require "pry"; binding.pry
  end
end
