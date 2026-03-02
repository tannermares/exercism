=begin
Write your code for the 'Saddle Points' exercise in this file. Make the tests in
`saddle_points_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/saddle-points` directory.
=end
class Grid
  def self.saddle_points(rows)
    cols = rows.transpose
    
    rows.each_with_index.each_with_object([]) do |(row, index), accu|
      row.each_with_index do |point, idx|
        next unless point == row.max
        next unless point == cols[idx].min

        accu << { "row" => index + 1, "column" => idx + 1 }
      end
    end
  end
end