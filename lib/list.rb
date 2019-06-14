require "./lib/node.rb"

class List
  attr_reader :head
  def initialize
    @head = nil
    @list_size = 0
  end

  def append(surname, supplies = nil)
    find_node_by_index(@list_size -1).set_next(Node.new(surname, supplies)) if !@head.nil?
    @head = Node.new(surname, supplies) if @head.nil?
    @list_size += 1
    circle_wagons
  end

  def count
    @list_size
  end

  def to_string
    string_list
  end

  def prepend(surname, supplies = nil)
    new_head = Node.new(surname, supplies)
    new_head.set_next(@head)
    @head = new_head
    @list_size += 1
    circle_wagons
  end

  def insert(index, surname, supplies = nil)
    new_node = Node.new(surname, supplies)
    insert_node = find_node_by_index(index - 1)
    new_node.set_next(insert_node.next_node)
    insert_node.set_next(new_node)
    @list_size += 1
    circle_wagons
  end

  def find_node_by_index(index, node = @head, current_index = 0)
    return node if current_index >= index || current_index == (@list_size - 1)
    current_index += 1
    find_node_by_index(index, node.next_node, current_index)
  end

  def string_list(node = @head, string = nil, node_counter = 0)
    return string if node_counter == @list_size
    string = "The #{node.surname} family" if node == @head
    string += ", followed by the #{node.surname} family" if node != @head
    node_counter += 1
    string_list(node.next_node, string, node_counter)
  end

  def string_list_limited(node, limit, current_index = 0, string = nil)
    return string if current_index >= limit || (node == @head && !string.nil?)
    string += ", followed by the #{node.surname} family" if !string.nil?
    string = "The #{node.surname} family" if string.nil?
    current_index += 1
    string_list_limited(node.next_node, limit, current_index, string)
  end

  def find(start_index = 0, number_of_names = @list_size)
    start_node = find_node_by_index(start_index)
    string_list_limited(start_node, number_of_names)
  end

  def includes?(search_value, node = @head, searched_nodes_count = 0)
    return false if searched_nodes_count == @list_size
    return true if node.surname == search_value
    searched_nodes_count += 1
    includes?(search_value, node.next_node, searched_nodes_count)
  end

  def pop
    return nil if @list_size == 0
    new_tail = find_node_by_index(@list_size - 2)
    if new_tail == @head
      puts "The #{new_tail.surname} family has died of dysentery"
      @head = nil
    else
      puts "The #{new_tail.next_node.surname} family has died of dysentery"
      new_tail.set_next(@head)
    end
    @list_size -= 1
  end

  def train_supplies(node = @head, hash = {}, node_counter = 0)
    hash.merge!(node.supplies) {|key, v1, v2| v1 + v2}
    node = node.next_node
    node_counter += 1
    return hash if node_counter == @list_size
    train_supplies(node, hash, node_counter)
  end

  def circle_wagons
    tail = find_node_by_index(@list_size - 1)
    tail.set_next(@head)
  end
end
