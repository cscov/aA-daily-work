require_relative 'skeleton/lib/00_tree_node'
class KnightPathFinder
  attr_reader :starting_pos

  def initialize(starting_pos)
    @starting_pos = starting_pos
    @visited_positions = [starting_pos]
  end

  def build_move_tree

  end

  def self.valid_moves(pos)
    moves = KnightPathFinder.moves_generator(pos)
    moves.reject { |move| move.first < 0 || move.first > 7 ||
    move.last < 0 || move.last > 7 }
  end

  def self.moves_generator(pos)
    moves = [[2, -1], [2, 1], [-2, -1], [-2, 1], [1, 2], [-1, 2], [1, -2], [-1, 2]]
    moves.map! do |move|
    PolyTreeNode.new([(move.first + pos.value.first), (move.last + pos.value.last)])

    end
  end

  def new_move_positions(pos)

  end
end

kpf = KnightPathFinder.new([0,0])
