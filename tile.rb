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

  def find_surrounding_tiles(@grid, x, y)
    8.times do |num|
      if board.grid(x-1, y).is_a?(Boolean)

    end

  end

  def neighbors
  end

  def neighbor_bomb_count
  end

  def inspect

  end

  private
  MOVES = [
    [ 1, 0]
    [-1, 0]
    [ 0, 1]
    [ 0,-1]
    [ 1, 1]
    [-1,-1]
    [-1, 1]
    [1, -1]
  ]
end
