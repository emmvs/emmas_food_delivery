# We also need to require the view
require_relative "../models/meal"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    # @meals_view = MealsView.new
  end
end
