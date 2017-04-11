require_relative '../config/environment'
require 'open-uri'
require 'pry'
require 'nokogiri'
require 'colorize'

class Guitarist
  attr_accessor :name, :blurb, :rank

  @@all = []

  def self.all
    @@all
  end

  def initialize(name = nil, rank = nil)
    @name = name
    @rank = rank
    @@all << self
  end

  def self.assign_attributes(guitarist)
    new_url = guitarist.name.downcase.gsub(" ", "-").gsub("b.b.", "b-b").gsub("edward", "eddie").gsub("j.", "j")
    if new_url == "jimi-hendrix"
      @website = Nokogiri::HTML(open("http://www.rollingstone.com/music/lists/100-greatest-guitarists-20111123/#{new_url}-20120705"))
      guitarist.blurb = @website.css(".collection-item").text
    elsif new_url == "hubert-sumlin"
      @website = Nokogiri::HTML(open("http://www.rollingstone.com/music/lists/100-greatest-guitarists-20111123/#{new_url}-20111205"))
      guitarist.blurb = @website.css(".collection-item").text
    elsif new_url == "eddie-hazel"
      @website = Nokogiri::HTML(open("http://www.rollingstone.com/music/lists/100-greatest-guitarists-20111123/#{new_url}-20111202"))
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

  def self.shave_blurb(guitarist)
    guitarist.blurb = guitarist.blurb.to_s.gsub(/^Related(.*?) (.*)$/, "").gsub(/\r\n?|\n/, "").gsub("Key Tracks", "\n\nKey Tracks").strip
  end

  def self.find(index)
    @@all[index]
  end

  def self.print_ranker
    Guitarist.all.each do |guitarist|
      puts "#{guitarist.rank}. #{guitarist.name}".yellow.bold
    end
  end

end
