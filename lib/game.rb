require_relative './frame'

class Game

  attr_reader :frame, :total_score, :bonus_points

  LAST_FRAME = 10

  def initialize(frame = Frame.new)
    @frame = frame
    @total_score = 0
    @bonus_points = 0
    @roll = 0
    reduced_points = false
    @last_frame_bonus_roll = 0
  end

  def calculate_total_score(num)

    return unless @frame.frame_no <= LAST_FRAME || @last_frame_bonus_roll > 0
    @last_frame_bonus_roll = 0

    @frame.knocked_down_pins(num)
    @roll += 1

    add_bonus_points
    determine_future_bonus_points
    add_points
    last_frame_bonus_roll
    reset_knocked_down_pins_log
  end

  def add_bonus_points
    if @bonus_points == 1
      if @frame.knocked_down_pins_log[1] != nil
         @total_score += @frame.knocked_down_pins_log[1]
         @bonus_points -= 1
      else 
         @total_score += @frame.knocked_down_pins_log.sum
         @bonus_points -= 1
      end
     elsif @bonus_points == 2
         @total_score += @frame.knocked_down_pins_log[0]
         @bonus_points -= 1
         @reduced_points = true
     end
  end

  def add_points
    if strike? || @roll == 2
      @total_score += @frame.knocked_down_pins_log.sum
      @roll = 0
      @frame.change_frame
    end
  end

  def last_frame_bonus_roll
    if @frame.frame_no == LAST_FRAME && strike? || spare?
      @last_frame_bonus_roll = 1
    end
  end

  def determine_future_bonus_points
    if spare?
      @bonus_points = 1
    elsif strike?
      @bonus_points = 2
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
    end
  end

  def strike?
    if @frame.knocked_down_pins_log.sum == 10 && @frame.knocked_down_pins_log.length == 1
      true
    end
  end
end
