require './board.rb'

class Tile

  def initialize(board, pos)
    @pos = pos
    @board = board
    @flagged = false
    @bombed = false
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def find_surrounding_tiles
    all_surrounding_moves = []
    MOVES.each do |(x, y)|
      all_surrounding_moves << [@pos.first + x, @pos.last + y]
    end
    all_surrounding_moves
  end

  def neightbors
    find_surrounding_tiles.select do |(x, y)|
      x.between?(0, @board.grid[0].length) && y.between?(0, @board.grid.length)
    end
  end

  def neighbor_bomb_count
  end

  def inspect

  end

  private
  MOVES = [
    [ 1, 0],
    [-1, 0],
    [ 0, 1],
    [ 0,-1],
    [ 1, 1],
    [-1,-1],
    [-1, 1],
    [1, -1]
  ]
end

if __FILE__ == $PROGRAM_NAME
  x = Board.new(2, 3)
  x.show
  tile = Tile.new(x, [1,0])
  p tile.neightbors
end
