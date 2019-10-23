require 'pry'
class Desserts::CLI

  def start
    puts ""
    puts "Bonjour! Welcome to Lisa's French Patisserie!"
    puts ""
    #Desserts::Dessert.test
    main_menu
  end

  def main_menu
    puts ""
    puts "Type 'list' to see a list of our desserts."
    puts "Type 'exit' to exit program."
    puts ""
    input = gets.chomp
    if input.downcase == "list"
      list_desserts
    elsif input.downcase == "exit"
      puts "Thank you for visiting Lisa's French Patisserie! Au revoir!"
    elsif input.downcase == "random"
      puts "random"
    else
      invalid
      main_menu
    end
  end

  def list_desserts
    puts "Listing desserts..."
    Desserts::Dessert.scrape_desserts
    desserts = Desserts::Dessert.all
    desserts.each.with_index do |dessert, index|
      puts "#{index + 1}. #{dessert.name}"
    end
    puts ""
    puts "Please enter a number to view the details of the dessert:"

    input = gets.chomp

    if input.to_i.between?(1, Desserts::Dessert.all.size)
      index = input.to_i - 1
      dessert = Desserts::Dessert.all[index]
        puts "#{dessert.name}: #{dessert.description}"
        ask_again
      elsif input.downcase == "random"
        dessert = Desserts::Dessert.all.sample
        puts "#{dessert.name}: #{dessert.description}"
    else
      invalid
      main_menu
    end
  end

  def invalid
    puts "Invalid input. Please try again."
  end

  def ask_again
    puts "Would you like to view another dessert? Enter Y or N"
    input = gets.chomp
    if input.downcase == "y"
      list_desserts
    elsif input.downcase == "n"
      puts "Thank you for visiting Lisa's French Patisserie! Au revoir!"
    else
      invalid
      main_menu
    end
  end
end
