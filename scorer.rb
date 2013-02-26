#monkey patches
class Array
  # this assumes all the elements in the array are numbers
  def sum
    if self.length > 0
      self.inject(0) {|num, cumulative_number| cumulative_number = num + cumulative_number}
    else
      0
    end
  end
  def second
    (self.count > 1) ? self[1] : 0
  end
end
class Scorer
  attr_accessor :initial_data
  def initialize(some_bowling_game)
    self.initial_data = some_bowling_game
  end
  def number_of_frames
    initial_data.size
  end
  def frame_type_for(frame_number)
    current_frame = initial_data[frame_number - 1]
    if current_frame.size == 1
      frame_type = :strike
    elsif (current_frame.size == 2) and (current_frame.sum == 10)
      frame_type = :spare
    else
      frame_type = :normal
    end
  end
  def scores
    scores = []
    cumulative_score = 0
    10.times do |index|
      cumulative_score = cumulative_score + score_for_frame(index+1)
      scores[index] = cumulative_score
    end
    return scores
  end
  def total_score
    scores.last
  end
  def score_for_frame(frame_number)
    current_frame = initial_data[frame_number - 1]
    next_frame = initial_data[frame_number]
    next_next_frame = initial_data[frame_number + 1]
    current_frame_type = frame_type_for(frame_number)
    next_frame_type = frame_type_for(frame_number + 1) if frame_number < 10

    if current_frame_type == :normal
      score = current_frame.sum
    elsif current_frame_type == :spare
      score = current_frame.sum + next_frame.first
    else # current frame is a strike
      score = current_frame.sum + next_frame.first + next_frame.second
      if frame_number < 9
        score += next_next_frame.first if next_frame_type == :strike
      end
    end
    return score
  end

  def self.rspec_works
    return "a-okay"
  end
end

