=begin
Write your code for the 'Flatten Array' exercise in this file. Make the tests in
`flatten_array_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/flatten-array` directory.
=end
class FlattenArray
  def self.flatten(array, accu = [])
    array.each do |element|      
      if element.is_a? Array        
        flatten(element, accu)
      elsif element.nil?
        # do nothing
      else
        accu << element
      end
    end

    accu
  end
end