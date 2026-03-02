=begin
Write your code for the 'Triangle' exercise in this file. Make the tests in
`triangle_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/triangle` directory.
=end
class Triangle
  attr_reader :a, :b, :c
  
  def initialize(sides)
    @a = sides[0]
    @b = sides[1]
    @c = sides[2]
  end

  def equilateral?
    valid_triangle? && (a == b && a == c && a != 0)
  end

  def isosceles?
    valid_triangle? && (a == b || a == c || b == c)
  end

  def scalene?
    valid_triangle? && (a != b && a != c && b != c)
  end

  private

  def valid_triangle?
    a + b >= c && b + c >= a && a + c >= b
  end
end