require "./lib/list"

class WagonTrain

  attr_reader :list

  def initialize
    @list = List.new
  end

  def append(surname)
    @list.append(surname)
  end

  def count
    @list.count
  end
end
