class Robot
  attr_accessor :name

  class << self
    attr_accessor :possible_names

    def forget
      generate_possible_names
    end

    private

    def generate_possible_names
      @possible_names = ('AA000'..'ZZ999').to_a.shuffle!
    end
  end

  def initialize
    reset
  end

  def reset
    @name = Robot.possible_names.shift
  end
end
