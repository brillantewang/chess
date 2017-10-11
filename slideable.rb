module Slideable

  def moves
    all_moves = []
    x, y = @pos
    board_size = @board.grid.length - 1

    move_dirs.each do |dir|
      case dir
      when :left
        # all_moves += (0...y).map { |col_i| [x, col_i] }
        (y - 1).downto(0) do |col_i|
          pos = [x, col_i]
          if @board.empty?(pos)
            all_moves << pos
          elsif !@board.empty?(pos) && !same_color?(@board[pos])
            all_moves << pos
            break
          elsif !@board.empty?(pos) && same_color?(@board[pos])
            break
          end
        end

      when :right
        # all_moves += (y + 1..board_size).map { |col_i| [x, col_i] }

        (y + 1..board_size).each do |col_i|
          pos = [x, col_i]
          if @board.empty?(pos)
            all_moves << pos
          elsif !@board.empty?(pos) && !same_color?(@board[pos])
            all_moves << pos
            break
          elsif !@board.empty?(pos) && same_color?(@board[pos])
            break
          end
        end

      when :up
        # all_moves += (0...x).map { |row_i| [row_i, y] }

        (x-1).downto(0).each do |row_i|
          pos = [row_i, y]
          if @board.empty?(pos)
            all_moves << pos
          elsif !@board.empty?(pos) && !same_color?(@board[pos])
            all_moves << pos
            break
          elsif !@board.empty?(pos) && same_color?(@board[pos])
            break
          end
        end

      when :down
        # all_moves += (x + 1..board_size).map { |row_i| [row_i, y] }

        ((x+1)..board_size).each do |row_i|
          pos = [row_i, y]
          if @board.empty?(pos)
            all_moves << pos
          elsif !@board.empty?(pos) && !same_color?(@board[pos])
            all_moves << pos
            break
          elsif !@board.empty?(pos) && same_color?(@board[pos])
            break
          end
        end

      when :upleft
        row_i, col_i = @pos
        while row_i > 0 && col_i > 0
          row_i -= 1
          col_i -= 1
          pos = [row_i, col_i]
          if @board.empty?(pos)
            all_moves << pos
          elsif !@board.empty?(pos) && !same_color?(@board[pos])
            all_moves << pos
            break
          elsif !@board.empty?(pos) && same_color?(@board[pos])
            break
          end

        end

      when :upright
        row_i, col_i = @pos
        while row_i > 0 && col_i < board_size
          row_i -= 1
          col_i += 1
          pos = [row_i, col_i]
          if @board.empty?(pos)
            all_moves << pos
          elsif !@board.empty?(pos) && !same_color?(@board[pos])
            all_moves << pos
            break
          elsif !@board.empty?(pos) && same_color?(@board[pos])
            break
          end
        end

      when :downleft
        row_i, col_i = @pos
        while row_i < board_size && col_i > 0
          row_i += 1
          col_i -= 1
          pos = [row_i, col_i]
          if @board.empty?(pos)
            all_moves << pos
          elsif !@board.empty?(pos) && !same_color?(@board[pos])
            all_moves << pos
            break
          elsif !@board.empty?(pos) && same_color?(@board[pos])
            break
          end
        end

      when :downright
        row_i, col_i = @pos
        while row_i < board_size && col_i < board_size
          row_i += 1
          col_i += 1
          pos = [row_i, col_i]
          if @board.empty?(pos)
            all_moves << pos
          elsif !@board.empty?(pos) && !same_color?(@board[pos])
            all_moves << pos
            break
          elsif !@board.empty?(pos) && same_color?(@board[pos])
            break
          end

        end
      end
    end

    all_moves
  end
end
