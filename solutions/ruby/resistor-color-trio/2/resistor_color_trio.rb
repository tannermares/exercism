=begin
Write your code for the 'Resistor Color Trio' exercise in this file. Make the tests in
`resistor_color_trio_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-trio` directory.
=end
class ResistorColorTrio
  COLORS = %w[black brown red orange yellow green blue violet grey white]
  attr_reader :value
  
  def initialize(colors)
    first, second, zeros = colors.map { |color| COLORS.index(color) }
    @value = "#{first}#{second}#{'0' * zeros}".to_i
  end

  def label
    "Resistor value: #{display_value} #{ohms}"
  end

  def display_value
    value > 1000 ? value / 1000 : value
  end

  def ohms
    value > 1000 ? "kiloohms" : "ohms"
  end
end