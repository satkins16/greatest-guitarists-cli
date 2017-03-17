require_relative '../config/environment'
require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  @@all_guitarists = []

  def self.create_guitarists_hash
    website = Nokogiri::HTML(open("http://www.rollingstone.com/music/lists/100-greatest-guitarists-20111123"))

    binding.pry

    website.css("h2").text.each do |block|
      guitarist_name = block.css("h2").text
      new_guitarist = Guitarist.new(guitarist_name)
      guitarist_rank = block.css("h2 span").text.to_i
      new_guitarist.rank = guitarist_rank
      guitarist_blurb = block.css("p").first.text
      new_guitarist.blurb = guitarist_blurb
      guitarist_tracks = block.css("p").second.text
      new_guitarist.tracks = guitarist_tracks

      @@all_guitarists << {rank: guitarist_rank, name: guitarist_name, blurb: guitarist_blurb, tracks: guitarist_tracks}
    end
    @@all_guitarists
  end

  def self.full_list
    @@all_guitarists.each do |guitarist|
      guitarist.each do |key, value|
        puts "#{key} #{value}"
      end
    end
  end

  def self.create_ranker
    website = Nokogiri::HTML(open("http://www.imdb.com/list/ls052192776/"))
    #website.css(".list_item .info b a").text
    binding.pry
  end



Scraper.create_ranker
end