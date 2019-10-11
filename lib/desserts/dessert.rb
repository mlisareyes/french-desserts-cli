require 'pry'
class Desserts::Dessert
  attr_accessor :name, :description

  @@all = []

  def initialize(name, description)
    @name = name
    @description = description
    @@all << self
  end

  def self.all
    @@all
  end

  def self.scrape_desserts
    doc = Nokogiri::HTML(open("https://www.epicurious.com/recipes-menus/easy-french-desserts-quick-simple-recipes-gallery"))
      doc.css("div.gallery-slide-caption").map do |dessert|
        {
          name: dessert.css("h2.gallery-slide-caption__hed").text,
          description: dessert.css("p").text
        }
        binding.pry
    end
  end
end
