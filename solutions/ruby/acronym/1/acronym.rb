=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end

class Acronym
  def self.abbreviate(phrase)
    acronym = Acronym.new(phrase)
    acronym.abbreviate
  end

  def initialize(phrase)
    @phrase = phrase.gsub '-', ' '
  end

  def abbreviate
    letter_array.join
  end

  private

  attr_accessor :phrase

  def words
    AcronymUtils::Words.new(phrase.split ' ')
  end

  def letter_array  
    words.map(&:get_capital_first_letter)
  end
end

module AcronymUtils
  class Words
    attr_reader :words
    
    def initialize(words)
      @words = words.map { |word| AcronymUtils::Word.new(word) }
    end

    def map(&block)
      words.map(&block)
    end
  end

  class Word
    attr_reader :word
    
    def initialize(word)
      @word = word
    end
  
    def get_capital_first_letter
      letters.first.capitalize
    end

    def letters
      word.split('')
    end
  end
end