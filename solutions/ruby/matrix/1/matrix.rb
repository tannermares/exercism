=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end
class Matrix
  attr_reader :matrix_string
  
  def initialize(matrix_string)
    @matrix_string = matrix_string
  end

  def row(num)
    matrix[num - 1]
  end

  def column(num)
    matrix.map { |row| row[num - 1] }
  end

  private

  def matrix
    matrix_string.split("\n").map { |row_string| row_string.split(" ").map(&:to_i) }
  end
end