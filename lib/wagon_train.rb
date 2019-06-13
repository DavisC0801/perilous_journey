require "./lib/list"

class WagonTrain

  attr_reader :list

  def initialize
    @list = List.new
  end

  def append(surname, supplies = nil)
    @list.append(surname, supplies)
  end

  def count
    @list.count
  end

  def supplies
    @list.train_supplies
  end
end
