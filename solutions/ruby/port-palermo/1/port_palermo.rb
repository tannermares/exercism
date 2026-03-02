module Port
  # TODO: define the 'IDENTIFIER' constant
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city.slice(0, 4).upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    %w(OIL GAS).include?(ship_identifier.to_s.slice(0, 3)) ? :A : :B
  end
end
