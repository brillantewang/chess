require_relative 'piece'

class Board

  PIECES = {
    KING: [[0,3], [7,3]],
    QUEEN: [[0,4],[7,4]],
    BISHOP: [[0,2], [0,5], [7,2], [7,5]],
    KNIGHT: [[0, 1], [0,6], [7,1], [7,6]],
    ROOK: [[0,0], [0,7], [7,0], [7,7]]
  }

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate
  end

  def populate
    PIECES.each do |type, all_pos|
      all_pos.each { |pos| self[pos] = Piece.new(type, pos) }
    end
    pop_pawns_row(1)
    pop_pawns_row(6)
  end

  def pop_pawns_row(row)
    @grid[row].each_index do |col|
      pos = [row, col]
      self[pos] = Piece.new(:PAWN, pos)
    end
  end

  def move_piece(start_pos, end_pos)
    raise StandardError.new("Start position is empty!") if self[start_pos].nil?
    # raise StandardError.new("Can't move there!") unless self[start_pos].valid_move?(end_pos)
    transfer(start_pos, end_pos)
  end

  def transfer(start_pos, end_pos)
    cur_piece = self[start_pos]

    self[start_pos], self[end_pos] = nil, cur_piece
    cur_piece.pos = end_pos
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

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  # board.move_piece([0, 0], [2, 0])
  # p board[[0, 0]]
  # p board[[2, 0]]
  # p board[[2, 0]].pos == [2,0]

  board.move_piece([2,0], [0,0])

end
