require 'byebug'
class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    # debugger
    # parent = @parent
    if node.nil?
      @parent = nil
    else
      unless parent.nil?
        self.parent.children.delete(self)
      end
      @parent = node
      node.children << self unless node.children.include?(self)
    end
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise "Not a child of self" unless self.children.include?(node)
    node.parent = nil

  end

  def dfs(target_value)
    # p "self is #{self.value}"
    # debugger
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
    nil
  end

  def bfs(target_value)
    array = []
    array.push(self)
    until array.empty?
      first = array.shift
      return first if first.value == target_value
      first.children.each do |child|
        array << child
      end
    end
    nil
  end
end
