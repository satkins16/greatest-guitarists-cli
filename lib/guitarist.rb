require_relative '../config/environment'

class Guitarist
  attr_accessor :name, :blurb, :tracks, :rank

  @@all = []

  def initialize(name = nil)
    @name = name
    @@all << self
  end

end
