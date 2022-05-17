require_relative '../lib/game'

describe Game do

  let(:game) { described_class.new }

  context '#total_score' do
    it 'calculates the users total score' do
      game.calculate_total_score(5)
      game.calculate_total_score(3)
      game.calculate_total_score(4)
      game.calculate_total_score(4)

      expect(game.total_score).to eq 16
    end
  end

  context '#spare?' do
    it 'returns true if user achieved a spare' do
      game.frame.knocked_down_pins(6)
      game.frame.knocked_down_pins(4)

      expect(game.spare?).to be_truthy
    end

    it 'returns false if user did not achieve a spare' do
      game.frame.knocked_down_pins(6)
      game.frame.knocked_down_pins(3)

      expect(game.spare?).to be_falsey
    end
  end

  context '#strike?' do
    it 'returns true if user acheived a strike' do
      game.frame.knocked_down_pins(10)

      expect(game.strike?).to be_truthy
    end

    it 'returns false if user did not acheive a strike' do
      game.frame.knocked_down_pins(5)
      game.frame.knocked_down_pins(5)

      expect(game.strike?).to be_falsey
    end
  end

  context '#bonus_roll' do
    it 'provides 1 bonus roll based on a spare' do
      game.frame.knocked_down_pins(5)
      game.frame.knocked_down_pins(5)

      expect(game.determine_future_bonus_points).to eq 1
    end

    it 'provides 2 bonus rolls based on a strike' do
      game.frame.knocked_down_pins(10)

      expect(game.determine_future_bonus_points).to eq 2
    end
  end

  context '#bonus_points' do
    it 'allocates bonus points if the user earns a spare' do
      game.calculate_total_score(5)
      game.calculate_total_score(5)
      game.calculate_total_score(4)
      game.calculate_total_score(4)

      expect(game.total_score).to eq 22
    end

    it 'allocates bonus points if the user earns a strike' do
      game.calculate_total_score(10)
      game.calculate_total_score(1)
      game.calculate_total_score(1)

      expect(game.total_score).to eq 14
    end
  end
end
