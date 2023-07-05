class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
    @running = true
  end

  def run
    while @running
      print_menu
      choice = gets.chomp.to_i
      print `clear`
      route_action(choice)
    end
  end

  private

  def print_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Exit"
    print "> "
  end

  def route_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then stop!
    else puts "Try again..."
    end
  end

  # def route_action_with_if(choice)
  #   if choice == 1
  #     @meals_controller.add
  #   elsif choice == 2
  #     @meals_controller.list
  #   elsif choice == 3
  #     stop!
  #   else
  #     puts "Try again..."
  #   end
  # end

  def stop!
    @running = false
  end
end
