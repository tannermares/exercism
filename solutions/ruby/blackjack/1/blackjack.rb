module Blackjack
  def self.parse_card(card)
    case card
    when "ace" then 11
    when "king" then 10
    when "queen" then 10
    when "jack" then 10
    when "ten" then 10
    when "nine" then 9
    when "eight" then 8
    when "seven" then 7
    when "six" then 6
    when "five" then 5
    when "four" then 4
    when "three" then 3
    when "two" then 2
    else 0
    end
  end

  def self.card_range(card1, card2)
    card1_score = parse_card(card1)
    card2_score = parse_card(card2)
    total_score = card1_score + card2_score

    case total_score
    when (4..11) then "low"
    when (12..16) then "mid"
    when (17..20) then "high"
    else "blackjack"
    end  
  end

  def self.first_turn(card1, card2, dealer_card)
    return "P" if card1 == "ace" && card2 == "ace"

    dealer_score = parse_card(dealer_card)

    case card_range(card1, card2)
    when "blackjack"
      if dealer_score < 10
        "W"
      else 
        "S"
      end
    when "high"
      "S"
    when "mid"
      if dealer_score >= 7
        "H"
      else 
        "S"
      end
    else "H"
    end
  end
end
