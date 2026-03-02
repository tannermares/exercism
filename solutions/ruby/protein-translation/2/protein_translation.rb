=begin
Write your code for the 'Protein Translation' exercise in this file. Make the tests in
`protein_translation_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/protein-translation` directory.
=end
CODONS_OBJ = {
  "Methionine" => %w[AUG],
  "Phenylalanine" => %w[UUU UUC],
  "Leucine" => %w[UUA UUG],
  "Serine" => %w[UCU UCC UCA UCG],
  "Tyrosine" => %w[UAU UAC],
  "Cysteine" => %w[UGU UGC],
  "Tryptophan" => %w[UGG],
  "STOP" => %w[UAA UAG UGA]
}

class InvalidCodonError < StandardError; end

module Translation
  def self.of_rna(strand)
    strand.scan(/.{1,3}/).each_with_object([]) do |codon, accu|
      selected = CODONS_OBJ.select { |k, v| v.include?(codon) }.keys[0]
      
      raise InvalidCodonError if selected.nil?
      return accu if selected == "STOP"
      
      accu << selected
    end
  end
end