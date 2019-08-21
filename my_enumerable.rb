# frozen_string_literal: true

module Enumerable
  def my_each
    items = to_a
    for i in 0...items.size # rubocop:disable Style/For
      yield items[i]
    end
  end

  def my_each_with_index
    idx = -1
    my_each { |val| yield(val, idx += 1) }
  end

  def my_select
    result = []
    my_each do |*vals|
      result.push(vals.size > 1 ? vals : vals.first) if yield(*vals)
    end
    return result.to_h if is_a? Hash

    result
  end

  # TODO: Accept patterns?
  def my_all?(&block)
    block = proc { |obj| obj } unless block_given?
    my_each do |*vals|
      return false unless block[*vals]
    end
    true
  end

  def my_any?(&block)
    block = proc { |obj| obj } unless block_given?
    my_each do |*vals|
      return true if block[*vals]
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
      count += 1 if block[*vals]
    end
    count
  end

  def my_map(proc = nil, &block)
    block = proc if proc
    result = []
    my_each { |*vals| result.push block[*vals] }
    result
  end

  def my_inject(memo = nil)
    my_each do |val|
      memo = memo.nil? ? val : yield(memo, val)
    end
    memo
  end
end

def multiply_els(values)
  values.my_inject { |acc, n| acc * n }
end
