class MealsView
  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} : #{meal.price}€"
    end
  end

  def ask_user_for(sth)
    puts "What is the #{sth} of your meal?🍟"
    print "> "
    return gets.chomp
  end
end
