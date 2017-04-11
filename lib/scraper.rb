require_relative '../config/environment'
require 'open-uri'
require 'pry'
require 'nokogiri'
require 'colorize'

class Scraper

  def self.scrape_names
    website = Nokogiri::HTML(open("http://www.imdb.com/list/ls052192776/"))
    #website.css(".list_item .info b a").text
    #@guitarists_name_array = []
    website.css(".list_item .info b a").each_with_index do |block, i|
      if block.text == "John Farley"
        guitarist = Guitarist.new(block.text.gsub("Farley", "Fahey"), i + 1)
      elsif block.text == "Dane A. Davis"
        guitarist = Guitarist.new(block.text.gsub("Dane A. Davis", "Dave Davies"), i + 1)
      else
        guitarist = Guitarist.new(block.text, i + 1)
      end
    end
  end

  def self.create_info
    website = Nokogiri::HTML(open("http://www.rollingstone.com/music/lists/100-greatest-guitarists-20111123"))
    @info = website.css(".collection-item p").text
    @info
  end

  def self.print_info
    puts ""
    puts Scraper.create_info.gsub("e.THE VOTERS", "e.\n\nTHE VOTERS").gsub(")CONTRIB", ")\n\nCONTRIB").yellow.bold
  end


end
