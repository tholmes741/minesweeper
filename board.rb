class Board

attr_accessor :grid

  def initialize(length = 9, width = 9)
    @grid = Array.new(width) {Array.new(length)}
  end


  def show
    header = (0..@grid.length - 1).to_a.join('  ')
    puts "  #{header}"
    @grid.each_with_index { |row, i| display_row(row, i) }
  end

  def display_row(row, i)
    chars = row.join('  ')
    puts "#{i} #{chars}"
  end



  def all_pos
    positions = []
    i = 0
    while i < @grid.length
      j = 0
      while j < @grid[0].length
        positions << [i, j]
        j += 1
      end
      i += 1
    end
    positions
  end

  def populate_board
    randomized = all_pos.shuffle
    randomized.take(10).each do |pos|
      self[*pos] = Tile.new(pos,true)
    end
    randomized.drop(10).each do |pos|
      self[*pos] = Tile.new(pos)
    end
    randomized.each { |pos| self[*pos].board = self}
  end
  # def pick_random_spot
  #   random_pos = []
  #   until random_pos.length == 10
  #     random_pos << [rand(grid.length), rand(grid[0].length)]
  #     random_pos.uniq!
  #   end
  #
  #   random_pos
  # end
  #
  # def make_bombs
  #   pick_random_spot.each do |pos|
  #     grid[pos] = Tile.new(pos, @grid, true)
  #   end
  # end

  def valid_pos?(pos)
    x, y = pos
    x.between?(0, @grid[0].length - 1) && y.between?(0, @grid.length - 1)
  end

  def [](x, y)
    @grid[y][x]
  end

  def []=(x, y, value)
    @grid[y][x] = value
  end
end
