require "./test/test_helper"
require "./lib/wagon_train"
require "./lib/list"

class WagonTrainTest < Minitest::Test
  def setup
    @wt = WagonTrain.new
  end

  def test_it_exists
    assert_instance_of WagonTrain, @wt
  end

  def test_it_has_a_list
    assert_instance_of List, @wt.list
  end

  def test_list_head_is_nil_by_default
    assert_nil @wt.list.head
  end

  def test_new_items_can_be_added
    @wt.append("Davis")
    assert_equal @wt.list.head.surname, "Davis"
    assert_equal @wt.count, 1
    @wt.append("Mariner")
    assert_equal @wt.list.head.next_node.surname, "Mariner"
    assert_equal @wt.count, 2
  end
end
