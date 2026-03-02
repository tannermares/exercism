=begin
Write your code for the 'ETL' exercise in this file. Make the tests in
`etl_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/etl` directory.
=end
class ETL  
  def self.transform(old)
    old.each_with_object({}) do |(score, letters), accu|
      letters.each { |letter| accu[letter.downcase] = score }
    end
  end
end