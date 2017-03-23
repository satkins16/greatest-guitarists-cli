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
      new_url = guitarist.name.downcase.gsub(" ", "-").gsub("b.b.", "b-b").gsub("edward", "eddie").gsub("j.", "j")
      if new_url == "jimi-hendrix"
        @website = Nokogiri::HTML(open("http://www.rollingstone.com/music/lists/100-greatest-guitarists-20111123/#{new_url}-20120705"))
        guitarist.blurb = @website.css(".collection-item").text
      elsif new_url == "hubert-sumlin"
        @website = Nokogiri::HTML(open("http://www.rollingstone.com/music/lists/100-greatest-guitarists-20111123/#{new_url}-20111205"))
        guitarist.blurb = @website.css(".collection-item").text
      elsif new_url == "dimebag-darrell"
        begin
        @website = Nokogiri::HTML(open("http://www.rollingstone.com/music/lists/100-greatest-guitarists-20111123/#{new_url}-20111215"))
        guitarist.blurb = @website.css(".collection-item").text
        rescue
        end
      else
        begin
          @website = Nokogiri::HTML(open("http://www.rollingstone.com/music/lists/100-greatest-guitarists-20111123/#{new_url}-20111122"))
          guitarist.blurb = @website.css(".collection-item").text
        rescue
        end
      end
    end
  end

  def self.shave_blurb
    self.all.each do |guitarist|
    guitarist.blurb = guitarist.blurb.to_s.gsub(/^Related(.*?) (.*)$/, "").strip
    end
  end


  Guitarist.create_guitarists
  Guitarist.assign_attributes
  Guitarist.shave_blurb

end
