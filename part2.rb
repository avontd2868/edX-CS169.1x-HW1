class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless game[0][1] =~ /R|P|S/ and game[1][1] =~ /R|P|S/

  rules = {"R" => "S", "S" => "P", "P" => "R"}

  if rules[game[1][1]] == game[0][1]
    game[1][0]
    else
      game[0][0]
  end
end

def rps_tournament_winner(tournament)
  begin
    rps_game_winner tournament
  rescue WrongNumberOfPlayersError
    rps_tournament_winner tournament[0]
    rps_tournament_winner tournament[1]
  rescue NoSuchStrategyError

  end


end