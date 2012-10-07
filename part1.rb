def palindrome?(str)
  str.downcase.gsub(/\W/,'').reverse == str.downcase.gsub(/\W/,'')
end

def count_words(str)
  counts = {}
  str.downcase.scan(/\b[a-z]+/).each do |word|
    if counts[word].nil? then
      counts[word] = 1
    else
      counts[word] += 1
    end
  end
  counts
end
