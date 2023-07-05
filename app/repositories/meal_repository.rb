require "csv"
require_relative "../models/meal"

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    # @next_id is used to give an unique id to the next meal object being created
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(meal)
    meal.id = @next_id
    @meals << meal
    # Prepare the id for the next meal object
    @next_id += 1
    save_csv
  end

  def all
    @meals
  end

  def find(id)
    @meals.find do |meal|
      meal.id == id
    end
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    # Getting @meals from CSV
    CSV.foreach(@csv_file, headers: true, header_converters: :symbol, strip: true) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    # Make sure that the id written in the CSV file is different from each meal
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end
end
