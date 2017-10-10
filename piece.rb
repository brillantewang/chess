require_relative "slideable"
require_relative "stepable"
require_relative "board"
require "singleton"

class Piece
  attr_accessor :pos

  def initialize(pos, board)
    @pos = pos
    @board = board
  end

end

class King < Piece
  include Stepable

  protected

  def move_diffs
    [[-1, 0], [1, 0], [0, 1], [0, -1]]
  end

end

class Knight < Piece
  include Stepable

  protected

  def move_diffs
    [[-2, -1], [-2, 1], [2, 1], [2, -1], [-1, -2], [1, -2], [1, 2], [-1, 2]]
  end

end

class Rook < Piece
  include Slideable

  def move_dirs
    [:left, :right, :up, :down]
  end

end

class Bishop < Piece
  include Slideable

  def move_dirs
    [:upleft, :upright, :downleft, :downright]
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
    @symbol = ""
    @color = "none"
  end
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

if __FILE__ == $PROGRAM_NAME
  rook = Rook.new([4,2], Board.new)
  p rook.moves

end
