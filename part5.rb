class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
                  def #{attr_name}=(value)
                    @#{attr_name} = value
                    (@#{attr_name}_history ||= [nil]) << value
                  end
               }
  end
end

#class Foo
#  attr_reader :bar
#  attr_reader :bar_history
#  def bar=(value)
#    @bar=value
#    (@bar_history ||= [nil]) << value
#  end
#end

class Foo
  attr_accessor_with_history :bar
end


f = Foo.new
f.bar = 1
f.bar = 2
f.bar_history # => if your code works, should be [nil, 1, 2]
