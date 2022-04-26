require_relative '../../lib/game'

describe 'A user completes a full game' do
  let (:game) { Game.new }

  xit 'scores 133 points after playing 10 frames' do
    game.calculate_total_score(1)
    game.calculate_total_score(4)
    # score 5
    game.calculate_total_score(4)
    game.calculate_total_score(5)
    # score 14
    game.calculate_total_score(6)
    game.calculate_total_score(4)
    # score 23
    game.calculate_total_score(5)
    game.calculate_total_score(5)
    # score 39 (passes)
    game.calculate_total_score(10)
    # score 49 (fails - gives 39)
    p "Pin Log: #{game.frame.knocked_down_pins_log}"
    # game.calculate_total_score(0)
    # game.calculate_total_score(1)
    expect(game.total_score).to eq 49
  end
end
