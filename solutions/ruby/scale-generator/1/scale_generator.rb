=begin
Write your code for the 'Scale Generator' exercise in this file. Make the tests in
`scale_generator_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/scale-generator` directory.
=end
class Scale
  attr_reader :tonic, :minor

  TONICS = %w[C C# D D# E F F# G G# A A# B]
  FLAT_TONICS = %w[C Db D Eb E F Gb G Ab A Bb B]
  FLATS = %w[F Bb Eb Ab Db Gb]
  MINOR_FLATS = %w[D G C F Bb Eb]
  
  def initialize(tonic)
    @minor = tonic.downcase == tonic
    @tonic = tonic.capitalize
  end

  def chromatic
    if FLATS.include?(tonic)
      FLAT_TONICS[FLAT_TONICS.index(tonic)..-1] + FLAT_TONICS[0...FLAT_TONICS.index(tonic)]
    else
      TONICS[TONICS.index(tonic)..-1] + TONICS[0...TONICS.index(tonic)]
    end
  end

  def interval(steps)
    notes = if minor
      MINOR_FLATS.include?(tonic) ? FLAT_TONICS : TONICS
    else
      FLATS.include?(tonic) ? FLAT_TONICS : TONICS
    end

    current_note = tonic
    steps.chars.each_with_object([tonic]) do |step, accu|
      new_note_index = notes.index(current_note) + (step == "A" ? 3 : step == "M" ? 2 : 1)
      new_note_index %= notes.length
      current_note = notes[new_note_index]
      accu << notes[new_note_index]
    end
  end
end