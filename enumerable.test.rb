# frozen_string_literal: true

require './my_enumerable.rb'

TEST_ARRAY = [1,2,3,4,5]
TEST_HASH  = { one: 1, two: 2, three: 3, four: 4, five: 5 }

puts 'Testing array:'
TEST_ARRAY.my_each { |n| puts n }

puts "\nTesting hash:"
TEST_HASH.my_each { |key, value| puts "#{key} => #{value}" }

# puts TEST_ARRAY.my_map { |n| n * n }
