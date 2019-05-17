require "./lib/node.rb"

class List
  attr_reader :head
  def initialize
    @head = nil
    @count = 0
    @string = nil
  end

  def append(surname)
    tail(@head).next_node = Node.new(surname) if @head != nil
    @head = Node.new(surname) if @head == nil
  end

  def count
    @count = 0
    count_list(@head)
  end

  def to_string
    @string = nil
    string_list(@head)
  end

  def tail(node)
    return node if node.next_node == nil
    tail(node.next_node)
  end

  def count_list(node)
    return @count if node == nil
    @count += 1
    count_list(node.next_node)
  end

  def string_list(node)
    return @string if node == nil
    @string = "The #{node.surname} family" if node == @head
    @string += ", followed by the #{node.surname} family" if node != @head
    string_list(node.next_node)
  end

end
