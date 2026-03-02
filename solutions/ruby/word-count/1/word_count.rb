=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end
class Phrase
  attr_reader :sentence
  
  def initialize(sentence)
    @sentence = sentence
  end

  def word_count
    sentence.split(/\s|,/).each_with_object({}) do |word, accu|
      next if word.length == 0
      
      clean_word = word.gsub(/\A'|[^'\w\s]|'\Z/, '').downcase
      accu[clean_word] = (accu[clean_word] || 0) + 1
    end
  end
end