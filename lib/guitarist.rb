require_relative '../config/environment'

class Guitarist
  attr_accessor :name, :blurb, :tracks, :rank

  @@all = []

  def initialize(name = nil)
    @name = name
    @@all << self
  end

  def self.create_guitarists
    Scraper.create_ranker.each do |guitarist|
      guitarist_name = guitarist.gsub(/[[:digit:]][\W][\s]/, "")
      new_guitarist = Guitarist.new(guitarist_name)
    end
    @@all.each_with_index do |g, i|
      g.name = g.name.gsub(/[[:digit:]]/, "")
      g.rank = i.to_i + 1
    end
  end

  def self.all
    @@all
  end

  Guitarist.create_guitarists
  Guitarist.all
end
