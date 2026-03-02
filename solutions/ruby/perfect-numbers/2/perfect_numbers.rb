=begin
Write your code for the 'Perfect Numbers' exercise in this file. Make the tests in
`perfect_numbers_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/perfect-numbers` directory.
=end
module PerfectNumber
  def self.classify(num)
    raise RuntimeError if num <= 0 

    factor_sum = (1..num - 1).select { |n| (num % n).zero? }.sum
    
    if factor_sum > num
      "abundant"
    elsif factor_sum == num
      "perfect"
    else
      "deficient"
    end
  end
end