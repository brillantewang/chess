require_relative "slideable"
require_relative "stepable"
require_relative "board"
require "singleton"

class Piece
  attr_reader :color
  attr_accessor :pos

  def initialize(pos, board, color = 'white')
    @pos, @board, @color = #player 1(top) = white, #player 2(bottom) = black
      pos, board, color
  end

  def same_color?(piece)
    @color == piece.color
  end
end

class King < Piece
  include Stepable

  def symbol
    :Ki
  end

  protected

  def move_diffs
    [[-1, 0], [1, 0], [0, 1], [0, -1]]
  end

end

class Knight < Piece
  include Stepable

  def symbol
    :Kn
  end

  protected

  def move_diffs
    [[-2, -1], [-2, 1], [2, 1], [2, -1], [-1, -2], [1, -2], [1, 2], [-1, 2]]
  end

end

class Rook < Piece
  include Slideable

  def symbol
    :Ro
  end

  protected

  def move_dirs
    [:left, :right, :up, :down]
  end
end

class Bishop < Piece
  include Slideable

  def symbol
    :Bi
  end

  protected

  def move_dirs
    [:upleft, :upright, :downleft, :downright]
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
    @color = "none"
  end

  def symbol
    "  "
  end
end

class Queen < Piece
  include Slideable

  def symbol
    :Qu
  end

  protected

  def move_dirs
    [:upleft, :upright, :downleft, :downright, :left, :right, :up, :down]

  end
end

class Pawn < Piece

  def symbol
    :Pa
  end

  def moves
    all_moves = []
    cur_x, cur_y = @pos
    #take cur pos and add up to forward steps to get new pos
    if forward_dir == :down
      if forward_steps == 2
        new_pos1 = [cur_x + 2, cur_y]
        new_pos2 = [cur_x + 1, cur_y]
        all_moves << new_pos1 << new_pos2
      else
        new_pos = [cur_x + 1, cur_y]
        all_moves << new_pos
      end
    else # up
      if forward_steps == 2
        new_pos1 = [cur_x - 2, cur_y]
        new_pos2 = [cur_x - 1, cur_y]
        all_moves << new_pos1 << new_pos2
      else
        new_pos = [cur_x - 1, cur_y]
        all_moves << new_pos
      end
    end

    all_moves += side_attack
    #take cur pos and add side attack shift to get a new pos
  end

  protected

  def side_attack
    cur_x, cur_y = @pos
    if forward_dir == :down
      [[cur_x + 1, cur_y - 1], [cur_x + 1, cur_y + 1]]
    else
      [[cur_x - 1, cur_y - 1], [cur_x - 1, cur_y + 1]]
    end
  end

  def forward_steps
    at_start_row? ? 2 : 1
  end

  def forward_dir
    @color == 'white' ? :down : :up
  end

  def at_start_row?
    at_start_row_p1? || at_start_row_p2?
  end

  def at_start_row_p2?
    @color == 'black' && @pos.first == 6
  end

  def at_start_row_p1?
    @color == 'white' && @pos.first == 1 #player 1
  end

end


if __FILE__ == $PROGRAM_NAME
  rook = Queen.new([6, 0], Board.new, "white")

  # p rook.color
  p rook.moves

end

# class Knight < Piece
#   include "stepable"
#
#   attr_reader :move_diffs
#
#   def initialize(pos)
#     @move_diffs = [[-2, -1], [-2, 1], [2, 1], [2, -1], [-1, -2], [1, -2], [1, 2], [-1, 2]]
#     super
#   end
# end
