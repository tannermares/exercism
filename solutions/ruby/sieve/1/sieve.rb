=begin
Write your code for the 'Sieve' exercise in this file. Make the tests in
`sieve_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/sieve` directory.
=end
class Sieve
  attr_reader :max
  
  def initialize(max)
    @max = max
  end

  def primes
    return [] if max < 2
    
    list = (2..max).to_a
    prime = []
    composite = []
    
    until list.length == 0
      current_prime = list.shift
      current_multiple = 2
      current_composite = current_prime * current_multiple
      
      prime << current_prime
      
      until current_composite > max
        if list.index(current_composite)
          composite << list.slice!(list.index(current_composite))
        end
        
        current_composite = current_prime * (current_multiple + 1)
        current_multiple += 1
      end
    end

    prime
  end
end