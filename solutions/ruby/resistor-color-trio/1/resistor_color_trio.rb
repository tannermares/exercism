=begin
Write your code for the 'Resistor Color Trio' exercise in this file. Make the tests in
`resistor_color_trio_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-trio` directory.
=end
class ResistorColorTrio
  attr_accessor :colors

  COLORS = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9,
  }
  
  def initialize(colors)
    @colors = colors
  end

  def label
    "Resistor value: #{value}#{ohms}"
  end

  def value
    _value = colors
      .first(2)
      .map { |color| COLORS[color.to_sym] }
      .join("")
    
    _value.end_with?("0") && zeros >= 2 ? _value[0...-1] : _value
  end

  def zeros
    COLORS[colors.last.to_sym]
  end

  def ohms
    if zeros == 0
      " ohms"
    elsif zeros == 1
      "0 ohms"
    elsif zeros == 2
      " kiloohms"
    elsif zeros == 3
      " kiloohms"
    elsif zeros == 4
      "0 kiloohms"
    else
      "whoops"
    end
  end
end