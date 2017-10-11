require_relative "board"
require_relative "cursor"
require "colorize"

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    system("clear")
    total_board = ""
    @board.grid.each_with_index do |row, row_i|
      row_str = ""
      row.each_index do |piece_j|
        pos = [row_i, piece_j]
        if @cursor.cursor_pos == pos
          row_str << "[ #{@board[pos].symbol} ]".colorize(:color => :white, :background => :blue)
        else
          row_str << "[ #{@board[pos].symbol} ]"
        end
      end
      row_str += "\n"
      total_board << row_str
    end

    puts total_board
  end

end
