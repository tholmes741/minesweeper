class Board
attr_accessor :grid

  def initialize(length = 9, width = 9)
    @grid = Array.new(width) {Array.new(length)}
  end


  def show
     grid.each {|row| p row}
  end

  def pick_random_spot
    random_pos = []
    until random_pos.length == 10
      random_pos << [rand(grid.length), rand(grid[0].length)]
      random_pos.uniq!
    end

    random_pos    
  end
end
