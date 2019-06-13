class Node
  attr_reader :surname, :supplies, :next_node
  def initialize(surname, supplies = nil)
    @surname = surname
    @supplies = supplies
    @next_node = nil
  end

  def set_next(node)
    @next_node = node
  end
end
