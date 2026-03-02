=begin
Write your code for the 'Palindrome Products' exercise in this file. Make the tests in
`palindrome_products_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/palindrome-products` directory.
=end
class Palindromes
  attr_reader :max_factor, :min_factor, :palindromes
  
  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end
  
  def generate
    min_product = min_factor * min_factor
    max_product = max_factor * max_factor
    
    @palindromes = (min_factor..max_factor).each_with_object({}) do |factor1, accu|
      (factor1..max_factor).each do |factor2|
        product = factor1 * factor2

        if product >= min_product && product <= max_product && product.digits == product.digits.reverse
          accu[product] ||= []
          accu[product] << [factor1, factor2]
        end
      end
    end
  end

  def largest
    Palindrome.new(*palindromes.max)
  end

  def smallest
    Palindrome.new(*palindromes.min)
  end
end

class Palindrome
  attr_reader :value, :factors
  
  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end