class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter

    #attr_reader attr_name+"_history"   -- removing bad code in given template
    #because it returns nil instead of [nil] if no assignments have been made.

    class_eval %Q{
                  def #{attr_name}=(value)
                    @#{attr_name} = value
                    (@#{attr_name}_history ||= [nil]) << value
                  end
                  def #{attr_name}_history
                    @#{attr_name}_history || [nil]
                  end
               }
  end
end

class Foo
  attr_accessor_with_history :bar
end