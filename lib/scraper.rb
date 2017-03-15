require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def create_guitarists_hash
    website = Nokogiri::HTML("http://www.rollingstone.com/music/lists/100-greatest-guitarists-20111123")

    all_guitarists = []

    website.css(".collection-item h2").text.each do |guitarist|
      Guitarist.new(guitarist)
      
    end



    binding.pry
  end

end
