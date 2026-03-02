=begin
Write your code for the 'Protein Translation' exercise in this file. Make the tests in
`protein_translation_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/protein-translation` directory.
=end
CODONS = {
  "AUG" => "Methionine",
  "UUU" => "Phenylalanine",
  "UUC" => "Phenylalanine",
  "UUA" => "Leucine", 
  "UUG" => "Leucine",
  "UCU" => "Serine", 
  "UCC" => "Serine", 
  "UCA" => "Serine", 
  "UCG" => "Serine",
  "UAU" => "Tyrosine", 
  "UAC" => "Tyrosine",
  "UGU" => "Cysteine",
  "UGC" => "Cysteine",
  "UGG" => "Tryptophan",
  "UAA" => "STOP", 
  "UAG" => "STOP", 
  "UGA" => "STOP"
}

class InvalidCodonError < StandardError; end

module Translation
  def self.of_rna(strand)
    strand.chars.each_slice(3).map(&:join).each_with_object([]) do |codon, accu|
      return accu if CODONS[codon] == "STOP"
      raise InvalidCodonError if CODONS[codon].nil?
      accu << CODONS[codon]
    end
  end
end