

class Item
  attr_accessor :name, :price

  @@all = []

  def initialize(name,price)
    @name = name
    @price = price
    self.class.all << self 
  end

  def self.all 
    @@all
  end

end
