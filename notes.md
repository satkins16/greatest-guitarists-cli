Expand blurbs(only getting first "p")


require_relative '../config/environment'
require 'open-uri'
require 'pry'
require 'nokogiri'

class Guitarist
  attr_accessor :name, :blurb, :tracks, :rank

  @@all = []

  def self.all
    @@all
  end

  def initialize(name = nil)
    @name = name
    @@all << self
  end

  def self.create_guitarists
    Scraper.create_ranker.each do |guitarist|
      @guitarist_name = guitarist.gsub(/[[:digit:]][\W][\s]/, "")
      @new_guitarist = Guitarist.new(@guitarist_name)
    end
    @@all.each_with_index do |g, i|
      g.name = g.name.gsub(/[[:digit:]]/, "")
      g.rank = i.to_i + 1
    end
  end

  def self.assign_attributes
    self.all.each do |guitarist|
      new_url = guitarist.name.downcase.gsub(" ", "-")
      @counter = 0
      if new_url == "jimi-hendrix"
        website = Nokogiri::HTML(open("http://www.rollingstone.com/music/lists/100-greatest-guitarists-20111123/#{new_url}-20120705"))
        website.css("p").each do |block|
          if block.text.start_with?("100 Greatest Guitarists", "Find out who", "Key Tracks") == false
            guitarist.blurb = block.text
          elsif block.text.start_with?("Key Tracks")
            guitarist.tracks = block.text.gsub("Key Tracks:", "")
          end
        end
      else
        begin
          @website = Nokogiri::HTML(open("http://www.rollingstone.com/music/lists/100-greatest-guitarists-20111123/#{new_url}-20111122"))
        rescue
          binding.pry
          @website.css("p").each do |block|
            if block.text.start_with?("100 Greatest Guitarists", "Find out who", "Key Tracks", "Related", "What is this", "Sign up", "Please enable", "How we use") == false && block.text == ""
              guitarist.blurb = block.text
            elsif block.text.start_with?("Key Tracks")
              guitarist.tracks = block.text.gsub("Key Tracks:", "")
            end
          end
        end
      end
    end
  end


  Guitarist.create_guitarists
  Guitarist.assign_attributes
  binding.pry
end
