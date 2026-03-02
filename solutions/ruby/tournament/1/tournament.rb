=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end
class Tournament
  def self.tally(input)
    processed = process_input(input)
    output = "Team                           | MP |  W |  D |  L |  P\n"
    
    processed.each do |team, data|
      mp = data[:MP].to_s.rjust(3)
      w = data[:W].to_s.rjust(3)
      d = data[:D].to_s.rjust(3)
      l = data[:L].to_s.rjust(3)
      p = data[:P].to_s.rjust(3)

      output += "#{team.ljust(31)}|#{mp} |#{w} |#{d} |#{l} |#{p}\n"
    end
    
    output
  end

  private

  def self.process_input(input)
    processed = {}
    
    input.split("\n").each_with_object({}) do |line, accu|
      team1, team2, result = line.split(';')      
      processed[team1] ||= { MP: 0, W: 0, D: 0, L: 0, P: 0 }
      processed[team2] ||= { MP: 0, W: 0, D: 0, L: 0, P: 0 }
      
      processed[team1] = { 
        MP: processed[team1][:MP] + 1, 
        W: result == "win" ? processed[team1][:W] + 1 : processed[team1][:W], 
        D: result == "draw" ? processed[team1][:D] + 1 : processed[team1][:D], 
        L: result == "loss" ? processed[team1][:L] + 1 : processed[team1][:L],
        P: result == "win" ? processed[team1][:P] + 3 : result == "draw" ? processed[team1][:P] + 1 : processed[team1][:P]
      }
      
      processed[team2] = { 
        MP: processed[team2][:MP] + 1, 
        W: result == "loss" ? processed[team2][:W] + 1 : processed[team2][:W], 
        D: result == "draw" ? processed[team2][:D] + 1 : processed[team2][:D], 
        L: result == "win" ? processed[team2][:L] + 1 : processed[team2][:L],
        P: result == "loss" ? processed[team2][:P] + 3 : result == "draw" ? processed[team2][:P] + 1 : processed[team2][:P]
      }
    end

    processed.sort.to_a.sort { |a, b| b[1][:P] <=> a[1][:P] }.to_h
  end
end