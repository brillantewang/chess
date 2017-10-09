class Board

  PIECES = {
    KING: [[0,3], [7,3]],
    QUEEN: [[0,4],[7,4]],
    BISHOP: [[0,2], [0,5], [7,2], [7,5]],
    KNIGHT: [[0, 1], [0,6], [7,1], [7,6]],
    ROOK: [[0,0], [0,7], [7,0], [7,7]]
  }

  def initialize
    @grid = Array.new(8) { Array.new }
    populate
  end

  def populate
    @grid.each_index do |i|
      #Player: rows 0-1

      #Null: rows 2-5

      #Player:rows 6-7
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  # def populate_one_player
  #
  # end
  #
  # def populate_other_player
  #
  # end
  #
  # def populate_null
  #
  # end

end
