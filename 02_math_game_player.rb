class Player

  attr_accessor :life, :turn, :name


  def initialize(name = "Player")
    @name = name
    @life = 3
    @turn = false
  end

  def alive?
    @life > 0
  end

end