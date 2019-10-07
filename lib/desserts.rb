### REQUIRED GEMS ###
require 'open-uri'
require 'nokogiri'
require 'pry'

### NAMESPACE MODULE ###
module FrenchDesserts
end

### REQUIRED FILES ###
require_relative "./desserts/version"
require_relative "./desserts/dessert-description"
require_relative "./desserts/scraper"
require_relative "./desserts/cli"
