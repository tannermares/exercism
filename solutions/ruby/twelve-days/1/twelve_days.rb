=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end
class TwelveDays
  PARTS = [
    { day: 'first', gift: "a Partridge in a Pear Tree." },
    { day: 'second', gift: "two Turtle Doves" },
    { day: 'third', gift: "three French Hens" },
    { day: 'fourth', gift: "four Calling Birds" },
    { day: 'fifth', gift: "five Gold Rings" },
    { day: 'sixth', gift: "six Geese-a-Laying" },
    { day: 'seventh', gift: "seven Swans-a-Swimming" },
    { day: 'eighth', gift: "eight Maids-a-Milking" },
    { day: 'ninth', gift: "nine Ladies Dancing" },
    { day: 'tenth', gift: "ten Lords-a-Leaping" },
    { day: 'eleventh', gift: "eleven Pipers Piping" },
    { day: 'twelfth', gift: "twelve Drummers Drumming" }
  ]

  def self.song
    parts + "\n"
  end

  private

  def self.parts
    (0..11).map { |num| part(num) }.join("\n\n")
  end

  def self.part(num)
    "On the #{PARTS[num][:day]} day of Christmas my true love gave to me: #{gifts(num)}"
  end

  def self.gifts(num)
    to_sentence(PARTS[0..num].reverse.map { |part| part[:gift] })
  end

  def self.to_sentence(array)
    return array.join(', and ') if array.size < 3
    "#{array[0..-2].join(', ')}, and #{array.last}"
  end
end