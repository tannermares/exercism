=begin
Write your code for the 'High Scores' exercise in this file. Make the tests in
`high_scores_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/high-scores` directory.
=end
class HighScores
  attr_reader :_scores
  
  def initialize(scores)
    @_scores = scores
  end

  def scores
    @_scores
  end

  def latest
    _scores.last
  end

  def personal_best
    _scores.max
  end

  def personal_top_three
    _scores.sort.reverse.first(3)
  end

  def latest_is_personal_best?
    _scores.last == _scores.sort.last
  end
end