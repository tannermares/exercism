=begin
Write your code for the 'Nucleotide Count' exercise in this file. Make the tests in
`nucleotide_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/nucleotide-count` directory.
=end
class Nucleotide
  attr_reader :code
  
  def self.from_dna(code)
    raise ArgumentError if code.match(/[^ACGT]/)
    Nucleotide.new(code)
  end

  def initialize(code)
    @code = code
  end

  def count(*args)
    code.count(*args)
  end

  def histogram    
    code.chars.each_with_object({"A" => 0, "T" => 0, "C" => 0, "G" => 0 }) do |letter, accu|
      accu[letter] += 1
    end
  end
end