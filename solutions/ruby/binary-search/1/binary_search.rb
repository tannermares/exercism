=begin
Write your code for the 'Binary Search' exercise in this file. Make the tests in
`binary_search_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search` directory.
=end
class BinarySearch
  attr_reader :list, :temp_list, :real_index
  
  def initialize(list)
    @list = list
    @temp_list = list
    @real_index = temp_list.length / 2
  end

  def search_for(number)
    middle_index = temp_list.length / 2
    middle_item = temp_list[middle_index]

    return nil if middle_item.nil?
    return real_index if middle_item == number

    if middle_item > number
      @temp_list = temp_list[0...middle_index]
      new_middle_index = (@temp_list.length / 2.0).ceil

      new_length = -new_middle_index
    else
      @temp_list = temp_list[middle_index + 1..]
      new_middle_index = (@temp_list.length / 2.0).ceil

      new_length = if @temp_list.length % 2 === 0 
        new_middle_index + 1 
      else 
        new_middle_index
      end
    end
  
    @real_index += new_length
    
    search_for(number)
  end
end