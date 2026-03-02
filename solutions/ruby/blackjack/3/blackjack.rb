module Blackjack
  CARD_VALUES =  {
    "ace" => 11,
    "king" => 10,
    "queen" => 10,
    "jack" => 10,
    "ten" => 10,
    "nine" => 9,
    "eight" => 8,
    "seven" => 7,
    "six" => 6,
    "five" => 5,
    "four" => 4,
    "three" => 3,
    "two" => 2
  }
  
  def self.parse_card(card)
    card_value = CARD_VALUES[card]
    card_value.nil? ? 0 : card_value
  end

  def self.card_range(card1, card2)
    case parse_card(card1) + parse_card(card2)
    when (4..11) then "low"
    when (12..16) then "mid"
    when (17..20) then "high"
    when 21 then "blackjack"
    else raise "Impossible score!"
    end  
  end

  def self.first_turn(card1, card2, dealer_card)
    return "P" if card1 == "ace" && card2 == "ace"

    case card_range(card1, card2)
    when "blackjack" then parse_card(dealer_card) < 10 ? "W" : "S"
    when "high" then "S"
    when "mid" then parse_card(dealer_card) >= 7 ? "H" : "S"
    else "H"
    end
  end
end
