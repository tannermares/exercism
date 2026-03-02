=begin
Write your code for the 'Anagram' exercise in this file. Make the tests in
`anagram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/anagram` directory.
=end
class Anagram
  attr_accessor :word
  
  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.select do |candidate|
      candidate.downcase.chars.sort == word.downcase.chars.sort && candidate.downcase != word.downcase
    end
  end
end