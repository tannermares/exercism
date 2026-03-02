=begin
Write your code for the 'ETL' exercise in this file. Make the tests in
`etl_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/etl` directory.
=end
class ETL  
  def self.transform(old)
    old.invert.keys.flatten.each_with_object({}) do |letter, accu|
      accu[letter.downcase] = old.find { |point| point[1].include?(letter) }[0]
    end
  end
end