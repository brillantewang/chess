module Slideable

  def moves
    all_moves = []
    x, y = @pos
    board_size = @board.grid.length - 1

    move_dirs.each do |dir|
      case dir
      when :left
        all_moves += (0...y).map { |col_i| [x, col_i] }
      when :right
        all_moves += (y + 1..board_size).map { |col_i| [x, col_i] }
      when :up
        all_moves += (0...x).map { |row_i| [row_i, y] }
      when :down
        all_moves += (x + 1..board_size).map { |row_i| [row_i, y] }
      when :upleft
        row_i, col_i = @pos
        while row_i > 0 && col_i > 0
          row_i -= 1
          col_i -= 1
          all_moves << [row_i, col_i]
        end
      when :upright
        row_i, col_i = @pos
        while row_i > 0 && col_i < board_size
          row_i -= 1
          col_i += 1
          all_moves << [row_i, col_i]
        end
      when :downleft
        row_i, col_i = @pos
        while row_i < board_size && col_i > 0
          row_i += 1
          col_i -= 1
          all_moves << [row_i, col_i]
        end
      when :downright
        row_i, col_i = @pos
        while row_i < board_size && col_i < board_size
          row_i += 1
          col_i += 1
          all_moves << [row_i, col_i]
        end
      end
    end

    all_moves
  end
end
