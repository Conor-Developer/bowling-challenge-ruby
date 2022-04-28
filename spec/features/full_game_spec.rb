require_relative '../../lib/game'

describe 'A user completes a full game' do
  let (:game) { Game.new }

  it 'scores 133 points after playing 10 frames' do
    game.calculate_total_score(1)
    game.calculate_total_score(4)

    p "Pin Log: #{game.frame.knocked_down_pins_log}"
    p "Score: #{game.total_score}"
    # score 5

    game.calculate_total_score(4)
    game.calculate_total_score(5)

    p "Score: #{game.total_score}"
    # score 14

    game.calculate_total_score(6)
    game.calculate_total_score(4)

    p "Score: #{game.total_score}"
    # score 24

    game.calculate_total_score(5)
    game.calculate_total_score(5)

    p "Score: #{game.total_score}"
    p "Bonus points: #{game.bonus_points}"

    # score 39 - (passes test) with 1 bonus point
    game.calculate_total_score(10)

    p "Bonus points: #{game.bonus_points}"
    p "Score: #{game.total_score}" # Specifically at this point: 49 with 2 bonus points
    # score 60

    #p "Pin Log: #{game.frame.knocked_down_pins_log}"

    game.calculate_total_score(0)
    game.calculate_total_score(1)
  
    p "Score: #{game.total_score}"
    p "Bonus points: #{game.bonus_points}"
    # score 61 with 0 bonus points
    
    game.calculate_total_score(7)
    game.calculate_total_score(3)

    p "Score: #{game.total_score}"
    p "Bonus points: #{game.bonus_points}"

    # score 71 with 1 bonus points (passed)
    # p "Score: #{game.total_score}"
    # p "Bonus points: #{game.bonus_points}"

    game.calculate_total_score(6)
    game.calculate_total_score(4)

    # score 87 with 1 bonus point (passed)
    p "Score: #{game.total_score}"
    p "Bonus points: #{game.bonus_points}"

    game.calculate_total_score(10)

    # score 107 with 2 bonus points (passed)
    p "Score: #{game.total_score}"
    p "Bonus points: #{game.bonus_points}"

    game.calculate_total_score(2)
    game.calculate_total_score(8)

    p "Score: #{game.total_score}"
    p "Bonus points: #{game.bonus_points}"

    #game.calculate_total_score(6)
    expect(game.total_score).to eq 127
  end
end
