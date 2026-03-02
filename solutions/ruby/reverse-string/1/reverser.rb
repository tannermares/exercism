module Reverser
  def self.reverse(word)
    chars = word.chars
    reversed = []
    
    chars.each do |char|
      reversed.prepend(char)
    end

    reversed.join
  end
end
