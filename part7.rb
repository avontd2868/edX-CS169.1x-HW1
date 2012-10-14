class CartesianProduct
  include Enumerable
  attr_accessor :col1
  attr_accessor :col2

  def initialize(a,b)
    @col1, @col2 = a, b
  end

  def each
    elt1, elt2 = []
    @col1.each { |elt1| @col2.each { |elt2| yield [elt1, elt2] } }
  end
end
