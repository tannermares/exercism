class WordProblem
  attr_reader :question

  OPERATORS = {
    'divided' => :/,
    'minus' => :-,
    'multiplied' => :*,
    'plus' => :+,
  }.freeze
  VALID_OPERATORS = OPERATORS.keys.join("|").freeze

  def initialize(question)
    @question = question
  end

  def answer
    raise ArgumentError if arguments.length < 2
    raise ArgumentError if arguments.length != operators.length + 1

    arguments.drop(1).each_with_index.inject(arguments[0]) do |res, (arg, index)|
      current_operator = OPERATORS[operators[index]]
      res.send(current_operator, arg)
    end
  end

  private

  def arguments
    @arguments ||= question.scan(/(-?\d+)/).flatten.map(&:to_i) 
  end

  def operators
    @operators ||= question.scan(/(#{VALID_OPERATORS})/).flatten
  end
end