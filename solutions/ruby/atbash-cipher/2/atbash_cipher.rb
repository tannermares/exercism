module Atbash
  ALPHABET = ('a'..'z').to_a.freeze

  def self.encode(plaintext)
    encoded = atbash(plaintext)
    encoded.each_slice(5).to_a.map { |group| group.join }.flatten.join(" ")
  end

  def self.decode(ciphertext)
    decoded = atbash(ciphertext)
    decoded.join
  end

  def self.atbash(text)
    arr = []
    
    text.gsub(/\s+|\W+/, "").downcase.each_char do |char|
      next arr.push(char) if char.to_i.to_s == char

      current_index = ALPHABET.index(char)
      arr.push(ALPHABET[-current_index - 1])
    end

    arr
  end
end