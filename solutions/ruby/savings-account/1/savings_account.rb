module SavingsAccount
  
  def self.interest_rate(balance)
    if balance < 1000 && balance >= 0
      0.5
    elsif balance < 5000 && balance >= 1000
      1.621
    elsif balance >= 5000
      2.475
    else
      3.213
    end
  end

  def self.annual_balance_update(balance)
    balance + (balance * interest_rate(balance) / 100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    temp_balance = current_balance

    until temp_balance >= desired_balance
      temp_balance = annual_balance_update(temp_balance)
      years += 1
    end

    years
  end
end
