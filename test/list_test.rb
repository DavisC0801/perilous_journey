require "./test/test_helper.rb"
require "./lib/node.rb"
require "./lib/list.rb"

class ListTest < Minitest::Test
  def setup
    @list = List.new
  end

  def test_it_exists
    assert_instance_of List, @list
  end

  def test_it_has_a_nil_head_by_default
    assert_nil @list.head
  end

  def test_it_can_append_nodes_to_list
    @list.append("Davis")

    assert_nil @list.head.next_node
    assert_equal @list.count, 1
  end

  def test_it_has_a_to_string_function
    assert_nil @list.to_string

    @list.append("Davis")

    assert_equal @list.to_string, "The Davis family"
  end

  def test_multiple_nodes_can_be_added
    assert_nil @list.head

    @list.append("Davis")
    assert_nil @list.head.next_node

    @list.append("Mariner")

    assert_equal 2, @list.count
    assert_nil @list.head.next_node.next_node
  end

  def test_to_string_function_handles_multiple_nodes
    assert_nil @list.to_string

    @list.append("Davis")
    assert_equal @list.to_string, "The Davis family"

    @list.append("Mariner")
    assert_equal @list.to_string, "The Davis family, followed by the Mariner family"
  end

  def test_it_can_prepend_nodes_to_list
    assert_nil @list.head
    assert_nil @list.to_string

    @list.append("Mariner")
    assert_equal @list.to_string, "The Mariner family"
    assert_equal 1, @list.count

    @list.prepend("Davis")
    assert_equal @list.to_string, "The Davis family, followed by the Mariner family"
    assert_equal 2, @list.count
  end

  def test_it_can_insert_nodes_in_list
    assert_nil @list.head
    assert_nil @list.to_string

    @list.prepend("Davis")
    @list.append("Mariner")
    assert_equal @list.to_string, "The Davis family, followed by the Mariner family"

    @list.insert(1, "Chakeres")
    assert_equal @list.to_string, "The Davis family, followed by the Chakeres family, followed by the Mariner family"

    #expected behavor when out of scope is to add to end of chain
    @list.insert(50, "Cornelissen")
    assert_equal @list.to_string, "The Davis family, followed by the Chakeres family, followed by the Mariner family, followed by the Cornelissen family"
  end

  def test_it_has_find_functionality
    @list.append("Davis")
    @list.append("Mariner")
    @list.append("Chakeres")
    @list.append("Cornelissen")

    assert_equal @list.find(2, 1), "The Chakeres family"
    assert_equal @list.find(1, 3), "The Mariner family, followed by the Chakeres family, followed by the Cornelissen family"

    assert_equal @list.find(50, 50), "The Cornelissen family"
    assert_equal @list.find(0, 50), "The Davis family, followed by the Mariner family, followed by the Chakeres family, followed by the Cornelissen family"
  end
end
