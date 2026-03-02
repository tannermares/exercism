=begin
Write your code for the 'Sum Of Multiples' exercise in this file. Make the tests in
`sum_of_multiples_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/sum-of-multiples` directory.
=end
class SumOfMultiples
  attr_accessor :items
  
  def initialize(*items)
    @items = items
  end

  def to(level)
    multiples = []
    
    items.each do |item|
      temp_item = item
      next unless level > 1
      
      while temp_item < level
        multiples << temp_item
        temp_item += item
      end
    end

    multiples.uniq.sum
  end
end