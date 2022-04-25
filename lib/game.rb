require_relative './frame'

class Game

  attr_reader :frame, :total_score, :bonus_points

  def initialize(frame = Frame.new)
    @frame = frame
    @bonus_roll = 0
    @total_score = 0
    @bonus_points = 0
    @roll = 0
  end

  def calculate_total_score(num)
    @frame.knocked_down_pins(num)
    @roll += 1
    
    if @roll == 2
      @total_score += @frame.knocked_down_pins_log.sum
      @roll = 0
      reset_knocked_down_pins_log
    else 
      bonus_points # This needs to be reworked - make true/false switch?
    end
  end

  def reset_knocked_down_pins_log
    if strike? || spare? || @frame.knocked_down_pins_log.length == 2
      @frame.reset_knocked_down_pins_log
    end
  end

  def spare?
    if @frame.knocked_down_pins_log.sum == 10 && @frame.knocked_down_pins_log.length == 2
      true
    else false
    end
  end

  def strike?
    if @frame.knocked_down_pins_log.sum == 10 && @frame.knocked_down_pins_log.length == 1
      true
    else false
    end
  end

  def bonus_roll
    if spare?
      @bonus_roll = 1
    elsif strike?
      @bonus_roll = 2
    else @bonus_roll
    end
  end

  def bonus_points
    if bonus_roll == 1
      @total_score += @frame.knocked_down_pins_log[0]
    elsif bonus_roll == 2
      @total_score += @frame.knocked_down_pins_log[0]
      @total_score += @frame.knocked_down_pins_log[1]
    end
  end
end
