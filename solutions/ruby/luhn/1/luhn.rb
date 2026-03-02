=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end

class Luhn
  def self.valid?(number)
    clean_number = number.gsub(' ', '')
    
    return false if clean_number.length <= 1
    return false if clean_number.match(/\D/)
    
    number_array = clean_number.split("").map(&:to_i)
    
    doubled_array = number_array.map.with_index do |item, index|
      if clean_number.length.odd? ? index.odd? : index.even?
        item *= 2 
        item -= 9 if item > 9
      end

      item
    end

    doubled_array.sum % 10 == 0
  end
end