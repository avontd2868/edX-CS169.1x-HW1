class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    self / @@currencies[singular_currency]
  end
end

class String
  def palindrome?
    self.downcase.gsub(/\W/,'').reverse == self.downcase.gsub(/\W/,'')
  end
end

module Enumerable
  def palindrome?
    self_as_array = []
    self.each { |item| self_as_array << item }
    self_as_array == self_as_array.reverse
  end
end
