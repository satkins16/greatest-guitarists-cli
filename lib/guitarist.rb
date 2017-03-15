class Guitarist
  attr_accessor :name, :blurb, :tracks, :rank

  @@ all = []

  def initialize(name)
    @name = name
    @@all << self
  end

end
