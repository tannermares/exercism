=begin
Write your code for the 'All Your Base' exercise in this file. Make the tests in
`all_your_base_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/all-your-base` directory.
=end
module BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base < 2
    raise ArgumentError if output_base < 2
    raise ArgumentError if digits.any? {|d| d < 0 }
    raise ArgumentError if digits.any? {|d| d >= input_base }
    return [0] if digits.all?(&:zero?)
    
    num = []    
    decimal_value = 0
    multiplier = 1

    # Convert from the original base to decimal
    digits.reverse.each do |digit|
      decimal_value += digit.to_i * multiplier
      multiplier *= input_base
    end

    # Convert from decimal to the desired base
    while decimal_value > 0
      num << decimal_value % output_base
      decimal_value /= output_base
    end
    
    num.reverse
  end
end