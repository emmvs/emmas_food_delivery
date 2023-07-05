class Meal
  attr_accessor :id # Increment the id when creating a new meal
  attr_reader :name, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price] || 0
  end
end
