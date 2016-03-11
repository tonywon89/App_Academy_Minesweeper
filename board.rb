require_relative 'tile'
require 'byebug'
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

  def render
    puts "  #{(0...grid.size).to_a.join(' ')}"
    rows.each_with_index do |row, i|
      rendered_row = row.map(&:to_s).join(" ")
      puts "#{i} #{rendered_row}"
    end
  end
end

board = Board.new
board.populate
board.render
