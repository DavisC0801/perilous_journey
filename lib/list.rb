require "./lib/node.rb"

class List
  attr_reader :head
  def initialize
    @head = nil
    @count = 0
    @string = nil
  end

  def append(surname)
    tail(@head).add_node(Node.new(surname)) if @head != nil
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

  def prepend(surname)
    new_head = Node.new(surname)
    new_head.add_node(@head)
    @head = new_head
  end

  def insert(index, surname)
    new_node = Node.new(surname)
    @count = 0
    insert_node = find_node_by_index(index - 1, @head)
    new_node.add_node(insert_node.next_node)
    insert_node.add_node(new_node)
  end

  def tail(node)
    return node if node.next_node == nil
    tail(node.next_node)
  end

  def find_node_by_index(index, node)
    return node if @count == index || node.next_node == nil
    @count += 1
    find_node_by_index(index, node.next_node)
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

  def string_list_limited(node, limit)
    return @string if @count >= limit || node == nil
    @string += ", followed by the #{node.surname} family" if @string != nil
    @string = "The #{node.surname} family" if @string == nil
    @count += 1
    string_list_limited(node.next_node, limit)
  end

  def find(index, count)
    @count = 0
    start_node = find_node_by_index(index, @head)
    @string = nil
    @count = 0
    string_list_limited(start_node, count)
  end

end
