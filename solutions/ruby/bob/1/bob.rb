=begin
Write your code for the 'Bob' exercise in this file. Make the tests in
`bob_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bob` directory.
=end
module Bob
  def self.hey(remark)
    if yelling?(remark)
      "Whoa, chill out!"
    elsif yell_question?(remark)
      "Calm down, I know what I'm doing!"
    elsif question?(remark)
      "Sure."
    elsif silence?(remark)
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end

  private

  def self.question?(remark)
    remark.match(/[a-z]|\d|\W/) && remark.strip.end_with?('?')
  end

  def self.yelling?(remark)
    remark.match(/[A-Z]/) && !remark.match(/[a-z]/) && !remark.end_with?('?')
  end

  def self.yell_question?(remark)    
    remark.match(/[A-Z]/) && !remark.match(/[a-z]/) && remark.end_with?('?')
  end

  def self.silence?(remark)
    (remark.match(/[\s\n\t]{2,}/) && !remark.match(/[a-z]/)) || remark.nil? || remark.empty?
  end
end