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
    @list.append("Davis")

    assert_equal @list.to_string, "The Davis family"
  end
end
