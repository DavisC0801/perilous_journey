require "./test/test_helper.rb"
require "./lib/node.rb"

class Nodetest < Minitest::Test
  def setup
    @node = Node.new("Davis")
  end

  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_it_has_a_saved_surname
    assert_equal @node.surname , "Davis"
  end

  def test_it_has_a_nil_next_node_by_default
    assert_nil @node.next_node
  end
end
