require 'pry'
class Desserts::Dessert
  attr_accessor :name, :description

  def initialize(name:, description:)
    @name = name
    @description = description
  end

  def self.all
    @@all = self.scrape_desserts.collect do |dessert| #this creates a new array of dessert objects taken from the scraped dessert hash
      self.new(dessert)
    end
  end


  def self.scrape_desserts
    doc = Nokogiri::HTML(open("https://www.epicurious.com/recipes-menus/easy-french-desserts-quick-simple-recipes-gallery"))
      doc.css("div.gallery-slide-caption").collect do |dessert|
        {
          name: dessert.css("h2.gallery-slide-caption__hed").text,
          description: dessert.css("p").text
        }
    end
  end

  def self.test

    binding.pry
  end

end
