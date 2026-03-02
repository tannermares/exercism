=begin
Write your code for the 'Bob' exercise in this file. Make the tests in
`bob_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bob` directory.
=end
module Bob
  def self.hey(remark)
    remark = Remark.new(remark)
    
    if remark.yell_question?
      "Calm down, I know what I'm doing!"
    elsif remark.yelling?
      "Whoa, chill out!"
    elsif remark.question?
      "Sure."
    elsif remark.silence?
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end
end

class Remark
  attr_reader :remark
  
  def initialize(remark)
    @remark = remark.strip
  end

  def question?
    remark.end_with?('?')
  end

  def yelling?
    remark == remark.upcase && remark != remark.downcase
  end

  def yell_question?    
    yelling? && question?
  end

  def silence?
    remark.empty?
  end
end