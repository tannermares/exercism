=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end
class Series
  attr_reader :numbers
  
  def initialize(number_string)
    @numbers = number_string.split("")
  end

  def slices(num)
    raise ArgumentError if num > numbers.length || num <= 0
    
    numbers.each.with_index.each_with_object([]) do |(_number, index), arr|
      current_slice = numbers[index...(index + num)]
      
      next unless current_slice.length == num
      arr << current_slice.join
    end
  end
end