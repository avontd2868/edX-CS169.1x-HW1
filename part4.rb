class Dessert
  def initialize(name, calories)
    @name, @calories = name, calories
  end

  attr_accessor :name, :calories

  def healthy?
    @calories < 200
  end
  
  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    @name, @calories, @flavor = name, calories, flavor
  end

  attr_accessor :name, :calories, :flavor

  def delicious?
    true unless @flavor == "black licorice"
  end
end
