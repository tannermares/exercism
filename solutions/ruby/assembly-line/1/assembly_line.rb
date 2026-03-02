class AssemblyLine
  DEFAULT_SPEED = 221
  SUCCESS_RATE = [0, 1, 1, 1, 1, 0.9, 0.9, 0.9, 0.9, 0.8, 0.77]
  attr_reader :speed
  
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    DEFAULT_SPEED * speed * SUCCESS_RATE[speed]
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
