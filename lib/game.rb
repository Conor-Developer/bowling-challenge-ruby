require_relative './frame'

class Game

  attr_reader :frame, :total_score, :bonus_points

  def initialize(frame = Frame.new)
    @frame = frame
   #  @bonus_roll = 0
    @total_score = 0
    @bonus_points = 0
    @roll = 0
    @frame_no = 1
  end

  def calculate_total_score(num)
    @frame.knocked_down_pins(num)
    @roll += 1
    
    bonus_roll

    if @bonus_points == 1 && (@frame.frame > @frame_no)
      @total_score += @frame.knocked_down_pins_log.sum
      @bonus_points = 0
    elsif @bonus_points == 2 && (@frame.frame > @frame_no)
      @total_score += @frame.knocked_down_pins_log.sum
      @bonus_points = 1
    end

    if strike? || @roll == 2
      @total_score += @frame.knocked_down_pins_log.sum
      @roll = 0
      @frame.change_frame
    end

    
    reset_knocked_down_pins_log
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

  def bonus_roll
    if spare?
      @bonus_points = 1
     # @frame_no = @frame.frame
    elsif strike?
      @bonus_points = 2
     # @frame_no = @frame.frame
    end
  end

  # def bonus_points
  #   if bonus_roll == 1
  #     @total_score += @frame.knocked_down_pins_log[0]
  #   elsif bonus_roll == 2
  #     @total_score += @frame.knocked_down_pins_log[0]
  #     @total_score += @frame.knocked_down_pins_log[1]
  #   end
  # end
end
