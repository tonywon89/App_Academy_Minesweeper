require_relative 'tile'

class Board

  def self.empty_grid
    Array.new(9) { Array.new(9) }
  end

  attr_accessor :grid

  def initialize(grid = Board.empty_grid)
    @grid = grid
  end

  def rows
    grid
  end

  def populate
    tiles = Tile.make_tiles(grid.flatten.size)
    @grid = rows.map do |row|
      row.map { tiles.pop }
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

end
