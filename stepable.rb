module Stepable
  def moves
    move_diffs.map do |(shift_x, shift_y)|
      cur_x, cur_y = @pos
      [cur_x + shift_x, cur_y + shift_y]
    end.select { |position| @board.in_bounds?(position) }
  end


end
