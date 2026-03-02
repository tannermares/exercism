=begin
Write your code for the 'Phone Number' exercise in this file. Make the tests in
`phone_number_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/phone-number` directory.
=end
class PhoneNumber
  def self.clean(number_string)
    clean_number = number_string.gsub(/\A\+?1|\D|\s|/, '')
    return nil if clean_number.length != 10
    return nil if %w[0 1].include?(clean_number[0])
    return nil if %w[0 1].include?(clean_number[3])
    
    clean_number
  end
end