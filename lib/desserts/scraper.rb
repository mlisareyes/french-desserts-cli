require 'pry'

class FrenchDesserts::Scraper

  def self.scrape_desserts
    doc = Nokogiri::HTML(open("https://www.epicurious.com/recipes-menus/easy-french-desserts-quick-simple-recipes-gallery"))
    doc.css("div.gallery-slide-caption").map do |dessert|
      {
        name: dessert.css("h2.gallery-slide-caption__hed").text,
        description:  dessert.css("p").text
      }
    end
  end
end
