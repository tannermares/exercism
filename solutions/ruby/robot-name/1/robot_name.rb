class Robot
  attr_accessor :name

  NUMBERS = (0..9).to_a.repeated_permutation(3).to_a.freeze
  ALPHAS = ('A'..'Z').to_a.repeated_permutation(2).to_a.freeze

  class << self
    attr_accessor :possible_names

    def forget
      generate_possible_names
    end

    private

    def generate_possible_names
      @possible_names = []

      ALPHAS.each do |alpha|
        NUMBERS.each do |number|
          @possible_names << alpha.join + number.join
        end
      end

      @possible_names.shuffle!
    end
  end

  def initialize
    Robot.generate_possible_names if self.class.possible_names.empty?
    generate_name
  end

  def reset
    generate_name
  end

  def generate_name
    @name = self.class.possible_names.shift
  end
end
