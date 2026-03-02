=begin
Write your code for the 'Collatz Conjecture' exercise in this file. Make the tests in
`collatz_conjecture_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/collatz-conjecture` directory.
=end
module CollatzConjecture
  def self.steps(num)
    raise ArgumentError if num <= 0
    steps = 0
    
    while num > 1
      num = num.even? ? num / 2 :  num * 3 + 1
      steps += 1
    end

    steps
  end
end