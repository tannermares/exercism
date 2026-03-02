=begin
Write your code for the 'Binary Search' exercise in this file. Make the tests in
`binary_search_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search` directory.
=end
class BinarySearch
  attr_reader :list
  
  def initialize(list)
    @list = list
    @new_list = {}
  end

  def search_for(number, index = list.length.divmod(2).sum - 1)
    return nil if middle_item.nil?
    return index if middle_item == number

    new_list = middle_item > number ? list[0...middle_index] : list[middle_index + 1..]
    new_length = (new_list.length / 2.0).ceil
    new_index = middle_item > number ? -new_length : new_length
    
    BinarySearch.new(new_list).search_for(number, index + new_index)
  end

  private

  def middle_index
    @middle_index ||= list.length.divmod(2).sum - 1
  end
  
  def middle_item
    @middle_item ||= list[middle_index]
  end
end