=begin
Write your code for the 'Armstrong Numbers' exercise in this file. Make the tests in
`armstrong_numbers_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/armstrong-numbers` directory.
=end
class ArmstrongNumbers
  def self.include?(num)
    string = num.to_s
    string.split('').sum { |num| num.to_i ** string.length } == num
  end
end