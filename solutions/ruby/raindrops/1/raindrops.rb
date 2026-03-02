=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end
class Raindrops
  def self.convert(num)
    drops = ""
    drops += "Pling" if num % 3 == 0
    drops += "Plang" if num % 5 == 0
    drops += "Plong" if num % 7 == 0
    drops += num.to_s if num % 3 != 0 && num % 5 != 0 && num % 7 != 0
    drops
  end
end