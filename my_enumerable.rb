# frozen_string_literal: true

module Enumerable
  def my_each
    items = to_a
    for i in 0...items.size
      yield(*items[i])
    end
  end

  def my_each_with_index
    idx = -1
    my_each { |*vals| yield(*vals, idx += 1) }
  end

  def my_select
    result = []
    my_each do |*vals|
      result.push(vals.size > 1 ? vals : vals.first) if yield(*vals)
    end
    return result.to_h if is_a? Hash

    result
  end

  def my_all?
    my_each do |*vals|
      return false unless yield(*vals)
    end
    true
  end

  def my_any?
    my_each do |*vals|
      return true if yield(*vals)
    end
    false
  end

  def my_none?(&block)
    !my_any?(&block)
  end

  def my_count(value = nil, &block)
    block = proc { |*val| value.nil? || value == val || val == [value] } unless block_given?
    count = 0
    my_each do |*vals|
      count += 1 if block.call(*vals)
    end
    count
  end

  def my_map(proc = nil, &block)
    block = proc if proc
    result = []
    my_each { |*vals| result.push block.call(*vals) }
    result
  end

  def my_inject
    # TODO: Complete function
  end
end
