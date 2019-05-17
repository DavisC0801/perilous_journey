class Node
  attr_reader :surname, :next_node
  def initialize(surname)
    @surname = surname
    @next_node = nil
  end
end
