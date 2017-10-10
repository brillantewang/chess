module Slideable

  def moves
    all_moves = []
    x, y = @pos
    board_size = @board.grid.length

    move_dirs.each do |dir|
      case dir
      when :left
        all_moves += (0...y).map { |col_i| [x, col_i] }
      when :right
        all_moves += (y + 1...board_size).map { |col_i| [x, col_i] }
      when :up
        all_moves += (0...x).map { |row_i| [row_i, y] }
      when :down
        all_moves += (x + 1...board_size).map { |row_i| [row_i, y] }
      end
    end

    all_moves
  end
end
