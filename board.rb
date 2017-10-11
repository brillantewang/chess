require_relative 'piece'
require_relative 'display'

class Board

  attr_reader :grid

  WHITE_PIECES = {
    KING: [[0,3]],
    QUEEN: [[0, 4]],
    BISHOP: [[0, 2], [0, 5]],
    KNIGHT: [[0, 1], [0, 6]],
    ROOK: [[0, 0], [0, 7]]
  }

  BLACK_PIECES = {
    KING: [[7,3]],
    QUEEN: [[7,4]],
    BISHOP: [[7,2], [7,5]],
    KNIGHT: [[7,1], [7,6]],
    ROOK: [[7,0], [7,7]]
  }

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate
  end


  def populate
    populate_color(WHITE_PIECES, "white")
    populate_color(BLACK_PIECES, "black")
    pop_pawns_row(1)
    pop_pawns_row(6)
    populate_null
  end

  def populate_color(hash, color)
    hash.each do |type, all_pos|
      all_pos.each do |pos|
        case type
        when :KING
          self[pos] = King.new(pos, self, color)
        when :QUEEN
          self[pos] = Queen.new(pos, self, color)
        when :BISHOP
          self[pos] = Bishop.new(pos, self, color)
        when :KNIGHT
          self[pos] = Knight.new(pos, self, color)
        when :ROOK
          self[pos] = Rook.new(pos, self, color)
        end
      end
    end
  end

  def populate_null
    null_piece = NullPiece.instance
    @grid.each_with_index do |row, row_i|
      row.each_index do |col_i|
        pos = [row_i, col_i]
        self[pos] = null_piece if self[pos].nil?
      end
    end
  end

  def pop_pawns_row(row)
    @grid[row].each_index do |col|
      pos = [row, col]
      self[pos] = Pawn.new(pos, self, 'white') if row == 1
      self[pos] = Pawn.new(pos, self, 'black') if row == 6
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

  def in_bounds?(pos)
    pos.all? { |n| n.between?(0, @grid.length - 1) }
  end

  def empty?(pos)
    self[pos].is_a?(NullPiece)
  end

  def test_cursor
    display = Display.new(self)
    while true
      display.render
      display.cursor.get_input
    end
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

  # board.move_piece([2,0], [0,0])
  board.test_cursor

end
