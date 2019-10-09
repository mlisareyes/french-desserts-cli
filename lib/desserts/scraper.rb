require 'pry'

class FrenchDesserts::Scraper

  def self.scrape_deserts
    doc = Nokogiri::HTML(open("https://www.epicurious.com/recipes-menus/easy-french-desserts-quick-simple-recipes-gallery"))
    binding.pry
  end
end
