class Guitarist
  attr_accessor :name, :blurb, :tracks

  @@ all = []

  def initialize(name)
    @name = name
    @@all << self
  end

end
