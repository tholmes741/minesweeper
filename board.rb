class Board
  def initialize(length = 9, width = 9)
    @grid = Array.new(width) {Array.new(length)}
    @moves = all_moves
  end

  def all_moves
    arr = []
    i = 0
    while i < @grid.length
      j = 0
      while j < @grid[0].length
        arr < [i, j]
        j += 1
      end
      i += 1
    end
    arr
  end
end
