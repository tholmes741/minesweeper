require './board.rb'

class Tile
  attr_reader :board, :bombed


  def initialize(pos, bomb = false)
    @pos = pos
    @flagged = false
    @bombed = bomb
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
    find_surrounding_tiles.select do |pos|
      @board.valid_pos?(pos)
    end
  end

  def neighbor_bomb_count
    bomb_counter
    neightbors.each do |pos|
      bomb_counter += 1 if board[*pos].bombed
    end
    bomb_counter
  end

  def board=(board)
    @board = board
  end

  def to_s
    @revealed ? neighbor_bomb_count : "x"
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
  x = Board.new(9, 9)
  x.populate_board
  x.show
end
