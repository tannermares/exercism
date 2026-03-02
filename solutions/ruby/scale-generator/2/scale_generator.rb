=begin
Write your code for the 'Scale Generator' exercise in this file. Make the tests in
`scale_generator_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/scale-generator` directory.
=end
class Scale
  attr_reader :note

  SCALE = %w[C C# D D# E F F# G G# A A# B]
  FLAT_SCALE = %w[C Db D Eb E F Gb G Ab A Bb B]
  
  def initialize(note)
    @note = Note.new(note)
  end

  def chromatic
    scale[scale.index(note.note)..-1] + scale[0...scale.index(note.note)]
  end

  def interval(steps)
    current_note = note.note
    steps.chars.each_with_object([note.note]) do |step, accu|
      new_note_index = scale.index(current_note) + (step == "A" ? 3 : step == "M" ? 2 : 1)
      new_note_index %= scale.length
      current_note = scale[new_note_index]
      accu << scale[new_note_index]
    end
  end

  def scale
    note.flat? ? FLAT_SCALE : SCALE
  end
end

class Note
  FLATS = %w[F Bb Eb Ab Db Gb]
  MINOR_FLATS = %w[D G C F Bb Eb]
  
  def initialize(note)
    @note = note
  end

  def flat?
    flats.include?(note)
  end

  def note
    @note.capitalize
  end

  private

  def flats
    minor? ? MINOR_FLATS : FLATS
  end

  def minor?
    note.downcase == @note
  end
end