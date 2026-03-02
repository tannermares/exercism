=begin
Write your code for the 'Transpose' exercise in this file. Make the tests in
`transpose_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/transpose` directory.
=end
class Transpose  
  def self.transpose(input)
    max_length = input.split("\n").map(&:length).max
    
    input
      .split("\n")
      .map { |row| row.gsub(" ", "~") }
      .map { |row| row.ljust(max_length) }
      .map(&:chars)
      .transpose
      .map(&:join)
      .map(&:rstrip)
      .map { |row| row.gsub("~", " ") }
      .join("\n")
  end
end