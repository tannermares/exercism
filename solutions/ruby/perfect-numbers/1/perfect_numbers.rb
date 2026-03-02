=begin
Write your code for the 'Perfect Numbers' exercise in this file. Make the tests in
`perfect_numbers_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/perfect-numbers` directory.
=end
module PerfectNumber
  def self.classify(num)
    raise RuntimeError if num <= 0 
    
    factors = [1]

    (1..num / 2).each do |factor1|
      (1..num / 2).each do |factor2|
        if factor1 * factor2 == num
          factors << factor1
          factors << factor2
          factors.sort!.uniq!
        end
      end
    end
    
    if factors.sum > num
      "abundant"
    elsif factors.sum == num
      "perfect"
    else
      "deficient"
    end
  end
end