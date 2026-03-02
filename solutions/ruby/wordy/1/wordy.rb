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
    raise ArgumentError if arguments.length != operators.length

    result = arguments[0]
    arguments.each_with_index do |arg, index|
      next if index.zero?

      current_operator = OPERATORS[operators[index]]
      result = result.send(current_operator, arg)
    end

    result
  end

  private

  def arguments
    @arguments ||= question.scan(/(-?\d+)/).flatten.map(&:to_i) 
  end

  def operators
    @operators ||= question.scan(/(#{VALID_OPERATORS})/).flatten.prepend("")
  end
end