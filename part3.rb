def combine_anagrams(words)
  anagrams = {}
  words.each_with_index do |current_word, index|          # identify anagrams and compile their indexes into a hash
    sorted = current_word.downcase.split(//).sort.join    # could/should have used chars method instead of split
    if anagrams.key? sorted
      anagrams[sorted].push index   # if anagram already exists, add other matches to its array
    else
      anagrams[sorted] = [index]    # create a new array if no anagrams for it have yet been found
    end
  end
  output = []                     # initialise output array
  anagram_group_index = 0
  anagrams.each_key do |key|
    output.push []          # create a new sub-array for each anagram group & collect all anagram matches into it
    anagrams[key].each { |index| output[anagram_group_index].push words[index] }
    anagram_group_index += 1
  end
  output
end
