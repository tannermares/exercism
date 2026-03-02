module Die
  DIE = [1, 2, 3, 4, 5, 6].freeze
  
  def self.roll
    DIE.sample
  end
end

class DndCharacter
  BASE_MODIFIER = 10
  ABILITIES = %i[strength dexterity constitution intelligence wisdom charisma]

  attr_accessor *ABILITIES
  
  def self.modifier(ability_score)
    (ability_score - BASE_MODIFIER) / 2
  end

  def initialize
    ABILITIES.each do |ability|
      score = [Die.roll, Die.roll, Die.roll, Die.roll].sort.last(3).sum
      self.send("#{ability}=", score)
    end
  end

  def hitpoints
    BASE_MODIFIER + DndCharacter.modifier(constitution)
  end
end
