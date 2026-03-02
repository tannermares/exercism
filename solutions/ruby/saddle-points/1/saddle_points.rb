=begin
Write your code for the 'Saddle Points' exercise in this file. Make the tests in
`saddle_points_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/saddle-points` directory.
=end
class Grid
  def self.saddle_points(input_matrix)
    _saddle_points = []
    
    input_matrix.each_with_index do |row, index|
      row.each_with_index do |point, idx|
        next unless point == row.max

        north_exists = !input_matrix[index - 1].nil?
        south_exists = !input_matrix[index + 1].nil?

        if (north_exists && point <= input_matrix[index - 1][idx]) && (south_exists && point <= input_matrix[index + 1][idx])
            _saddle_points << { "row" => index + 1, "column" => idx + 1 }
        elsif !north_exists && (south_exists && point <= input_matrix[index + 1][idx])
            _saddle_points << { "row" => index + 1, "column" => idx + 1 }
        elsif !south_exists && (north_exists && point <= input_matrix[index - 1][idx])
            _saddle_points << { "row" => index + 1, "column" => idx + 1 }
        elsif !north_exists && !south_exists
          _saddle_points << { "row" => index + 1, "column" => idx + 1 }
        end
      end
    end

    _saddle_points
  end
end