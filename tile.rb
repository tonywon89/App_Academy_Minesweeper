require_relative 'board'
require 'byebug'

class Tile
  MINES = 5
  def self.make_tiles(size)
    tiles = []
    num_of_mines = size/MINES
    num_of_mines.times { tiles << self.new(true) }
    (size - num_of_mines).times { tiles << self.new(false) }
    tiles.shuffle
  end

  def initialize(mine = false)
    @mine = mine
    @revealed = false
    @flagged = false
  end

  def revealed?
    @revealed
  end

  def mine?
    @mine
  end

  def flagged?
    @flagged
  end
end
