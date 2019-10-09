require 'pry'
class FrenchDesserts::CLI

  def start
    doc = Nokogiri::HTML(open("https://www.epicurious.com/recipes-menus/easy-french-desserts-quick-simple-recipes-gallery"))
    binding.pry
    puts "Bonjour! Welcome to Lisa's French Patisserie!"
    puts ""
    main_menu
  end

  def main_menu
    puts "Type 'list' to see a list of our desserts."
    puts "Type 'exit' to exit program."
    input = gets.chomp
    if input.downcase == "list"
      list_desserts
    elsif input.downcase == "exit"
      puts "Thank you for visiting Lisa's French Patisserie! Au revoir!"
    else
      invalid
      main_menu
    end
  end

  def list_desserts
    puts "Listing desserts..."
  end

  def invalid
    puts "Invalid input. Please try again."
  end
end
