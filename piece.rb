require_relative "stepable"

class Piece
  attr_reader :type
  attr_accessor :pos

  def initialize(pos)
    @pos = pos
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



class NullPiece < Piece

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
  king = King.new([0,0])
  p king.moves

end
