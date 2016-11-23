class Array
  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    result = []
    (0...length - 1).each do |i|
      ((i + 1)...length).each do |j|
        result << [i, j] if self[i] + self[j] == 0
      end
    end
    result
  end

  def my_transpose
    result = []
    self.length.times do
      result << []
    end

    self.each_with_index do |row, i|
      row.each_index do |j|
        result[i] << self[j][i]
      end
    end
    result
  end

  def stock_picker
    largest_profit = nil
    largest_profit_days = nil
    (0...length - 1).each do |i|
      ((i + 1)...length).each do |j|
        current_profit = self[j] - self[i]
        if largest_profit.nil? || current_profit > largest_profit
          largest_profit = current_profit
          largest_profit_days = [i, j]
        end
      end
    end
    largest_profit_days
  end
end

class TowersOfHanoi
  attr_reader :stacks

  def initialize(stacks = [[3, 2, 1], [], []])
    @stacks = stacks
  end

  def move(from_stack, to_stack)
    raise "NOOOOOOO" unless @stacks[to_stack].empty? || @stacks[to_stack].last > @stacks[from_stack].last
    @stacks[to_stack] << @stacks[from_stack].pop
  end

  def won?
    return false unless @stacks[0].empty? && @stacks[1..-1].one?(&:empty?)
    @stacks[1..-1].each do |stack|
      next if stack.empty?
      return false unless stack == stack.sort.reverse
    end
    true
  end
end
