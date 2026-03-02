module Atbash
  ALPHABET = ('a'..'z').to_a.freeze

  def self.encode(plaintext)
    encoded = []

    plaintext.gsub(/\s+|\W+/, "").downcase.each_char do |char|
      next encoded.push(char) if char.to_i.to_s == char

      current_index = ALPHABET.index(char)
      encoded.push(ALPHABET[-current_index - 1])
    end

    encoded.each_slice(5).to_a.map { |group| group.join }.flatten.join(" ")
  end

  def self.decode(ciphertext)
    decoded = []

    ciphertext.gsub(/\s+/, "").each_char do |char|
      next decoded.push(char) if char.to_i.to_s == char

      current_index = ALPHABET.index(char)
      decoded.push(ALPHABET[-current_index - 1])
    end

    decoded.join
  end
end