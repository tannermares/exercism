=begin
Write your code for the 'Proverb' exercise in this file. Make the tests in
`proverb_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/proverb` directory.
=end
class Proverb
  attr_reader :items, :qualifier
  
  def initialize(*items, qualifier: nil)
    @items = items
    @qualifier = qualifier ? "#{qualifier} " : ''
  end

  def to_s
    output = ""
    
    items.each_with_index do |item, index|
      next if index + 1 == items.length
      
      output += "For want of a #{item} the #{items[index + 1]} was lost.\n"
    end
    
    output += "And all for the want of a #{qualifier}#{items[0]}."
    output
  end
end