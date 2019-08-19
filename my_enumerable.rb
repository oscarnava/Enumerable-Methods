# frozen_string_literal: true

module Enumerable
  def my_each
    items = to_a
    for i in 0...items.size
      yield(*items[i])
    end
  end

  def my_each_with_index
    # TODO: Complete function
  end

  def my_select
    # TODO: Complete function
  end

  def my_all?
    # TODO: Complete function
  end

  def my_any?
    # TODO: Complete function
  end

  def my_none?
    # TODO: Complete function
  end

  def my_count
    # TODO: Complete function
  end

  def my_map
    # TODO: Complete function
  end

  def my_inject
    # TODO: Complete function
  end
end
