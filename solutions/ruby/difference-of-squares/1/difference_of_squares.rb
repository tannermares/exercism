=begin
Write your code for the 'Difference Of Squares' exercise in this file. Make the tests in
`difference_of_squares_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/difference-of-squares` directory.
=end
class Squares
  attr_reader :list
  
  def initialize(num)
    @list = (1..num)
  end

  def square_of_sum
    sum = list.sum
    sum * sum
  end

  def sum_of_squares
    list.map { |n| n * n }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end