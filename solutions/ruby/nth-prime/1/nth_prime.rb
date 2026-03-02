=begin
Write your code for the 'Nth Prime' exercise in this file. Make the tests in
`nth_prime_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/nth-prime` directory.
=end
module Prime
  def self.nth(max)
    raise ArgumentError if max.zero?
    
    prime_count = 1
    nth_prime = 2
    current_num = 2

    until prime_count == max
      if prime?(current_num + 1)
        nth_prime = current_num + 1
        prime_count += 1
      end

      current_num += 1
    end
  
    nth_prime
  end

  def self.prime?(num)
    return false if num <= 1
    return true if num == 2
    return false if num.even?

    divisor = 3
    while divisor <= Math.sqrt(num)      
      return false if num % divisor == 0
      divisor += 2
    end
    
    true
  end
end