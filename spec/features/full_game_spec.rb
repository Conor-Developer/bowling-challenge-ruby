require_relative '../../lib/game'

describe 'A user completes a full game' do
  let (:game) { Game.new }

  it 'scores 133 points after playing 10 frames' do
    game.calculate_total_score(1)
    game.calculate_total_score(4)
    game.calculate_total_score(4)
    game.calculate_total_score(5)
    game.calculate_total_score(6)
    game.calculate_total_score(4)
    game.calculate_total_score(5)
    game.calculate_total_score(5)
    game.calculate_total_score(10)
    game.calculate_total_score(0)
    game.calculate_total_score(1)
    game.calculate_total_score(7)
    game.calculate_total_score(3)
    game.calculate_total_score(6)
    game.calculate_total_score(4)
    game.calculate_total_score(10)
    game.calculate_total_score(2)
    game.calculate_total_score(8)
    game.calculate_total_score(6)
    
    expect(game.total_score).to eq 133
  end
end
