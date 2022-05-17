require_relative '../../lib/game'

describe 'A user completes a full game' do
  let (:game) { Game.new }

  it 'scores 0 points after playing 10 frames' do

    20.times do
      game.calculate_total_score(0)
    end

    expect(game.total_score).to eq 0
  end
end
