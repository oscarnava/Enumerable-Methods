# frozen_string_literal: true

require './my_enumerable.rb'

TEST_ARRAY = [1,2,3,4,5]

puts TEST_ARRAY.my_map { |n| n * n }
