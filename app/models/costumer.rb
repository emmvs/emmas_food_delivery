class Costumer
  attr_accessor :id
  attr_reader :name

  def initialize(attributes = {})
    @id = attributes[:id]
    @meals = attributes[:meals] || []
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def too_pricy?
    @price >= 50
  end

  def add_meal(meal)
    raise StandardError, "Meal is to expensive! 💰" if too_pricy?
    meal.costumer = self
    @meals << meal
  end
end
