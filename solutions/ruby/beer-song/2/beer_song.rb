=begin
Write your code for the 'Beer Song' exercise in this file. Make the tests in
`beer_song_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/beer-song` directory.
=end
module BeerSong
  def self.recite(bottles, verses)
    bottles.downto(bottles - (verses - 1)).map do |bottle|
      if bottle.zero?
        self.empty_verse
      elsif bottle == 2
        self.two_bottles(bottle)
      elsif bottle == 1
        self.one_bottle(bottle)
      else
        self.verse(bottle)
      end
    end.join("\n")
  end

  def self.verse(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
    "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  end

  def self.two_bottles(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
    "Take one down and pass it around, #{number - 1} bottle of beer on the wall.\n"
  end

  def self.one_bottle(number)
    "#{number} bottle of beer on the wall, #{number} bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def self.empty_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n"\
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end