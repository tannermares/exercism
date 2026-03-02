module Reverser
  def self.reverse(word)
    word.chars.each_with_object([]) { |char, accu| accu.prepend(char) }.join
  end
end
