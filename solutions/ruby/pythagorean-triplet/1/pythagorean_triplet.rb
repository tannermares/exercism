=begin
Write your code for the 'Pythagorean Triplet' exercise in this file. Make the tests in
`pythagorean_triplet_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pythagorean-triplet` directory.
=end
module PythagoreanTriplet
  def self.triplets_with_sum(num)    
    (1..num/3).each_with_object([]) do |a, accu|
      b = (-num ** 2 + 2 * num * a) / ( -2 * num + 2 * a )
      c = num - a - b
      
      next if a > b
      next if b > c
      next unless a**2 + b**2 == c**2

      accu << [a, b, c]
    end
  end
end