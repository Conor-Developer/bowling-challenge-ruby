require_relative '../../lib/game'

describe 'A user completes a full game' do
  let (:game) { Game.new }

  it 'scores 300 points after a perfect game' do


    12.times do
      game.calculate_total_score(10)
    end
    
      # game.calculate_total_score(10)

      # p "Points: #{game.total_score}"

      # game.calculate_total_score(10)

      # p "Points: #{game.total_score}"

      # game.calculate_total_score(10)

      # p "Points: #{game.total_score}"

      # #game.calculate_total_score(10)
      # #p "Points: #{game.total_score}"
  

    expect(game.total_score).to eq 300
  end
end